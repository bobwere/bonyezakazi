import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/application/jobs_details/jobs_completed_cubit/jobs_completed_cubit.dart';
import 'package:bonyeza_kazi/src/application/jobs_details/jobs_in_progress_cubit/jobs_in_progress_cubit.dart';
import 'package:bonyeza_kazi/src/application/jobs_details/jobs_pending_cubit/jobs_pending_cubit.dart';
import 'package:bonyeza_kazi/src/application/update_user_profile_cubit/update_user_profile_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/profile_page_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPProfile extends StatefulWidget {
  const SPProfile({Key key, this.username}) : super(key: key);
  final String username;

  @override
  _SPProfileState createState() => _SPProfileState();
}

class _SPProfileState extends State<SPProfile> {
  String userPhoto;
  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    getUserPhoto().then((value) => userPhoto = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocListener<UpdateUserProfileCubit, UpdateUserProfileState>(
        listener: (context, state) {
          state.userUpdateFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold((failure) {
                    failure.map(
                      serverError: (_) {
                        Flushbar(
                          title: 'An Error Occurred',
                          message: SERVER_ERROR_MESSAGE,
                          margin: EdgeInsets.all(20.h),
                          flushbarPosition: FlushbarPosition.TOP,
                          duration: Duration(seconds: 3),
                          isDismissible: true,
                          backgroundColor: Color(0xFFFD9726),
                          borderRadius: 15.h,
                        ).show(context);
                      },
                      noInternet: (_) {
                        Flushbar(
                          title: 'An Error Occurred',
                          message: NO_INTERNET_MESSAGE,
                          margin: EdgeInsets.all(20.h),
                          flushbarPosition: FlushbarPosition.TOP,
                          duration: Duration(seconds: 3),
                          isDismissible: true,
                          backgroundColor: Color(0xFFFD9726),
                          borderRadius: 15.h,
                        ).show(context);
                      },
                    );
                  }, (_) async {
                    Flushbar(
                      title: 'Update Successful',
                      message: ' ',
                      margin: EdgeInsets.all(20.h),
                      flushbarPosition: FlushbarPosition.TOP,
                      duration: Duration(seconds: 3),
                      isDismissible: true,
                      backgroundColor: Colors.green,
                      borderRadius: 15.h,
                    ).show(context);
                    await updateImage();
                  }));
          if (state.isSubmitting) {
            Flushbar(
              title: 'Attempting to update your details',
              message: 'Please wait a moment...',
              margin: EdgeInsets.all(20.h),
              flushbarPosition: FlushbarPosition.TOP,
              duration: Duration(seconds: 3),
              isDismissible: true,
              backgroundColor: Colors.green,
              borderRadius: 15.h,
            ).show(context);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kBlueBackgroundColor,
            centerTitle: true,
            title: Txt(
              'My Profile',
              style: kAppBarTxtStyle,
            ),
            actions: [
              PopupMenuButton<String>(
                onSelected: (choice) {
                  choiceAction(choice, authCubit, context);
                },
                itemBuilder: (BuildContext context) {
                  return Constants.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(
                        choice,
                        style: TextStyle(
                            fontSize: 21.h, fontWeight: FontWeight.w400),
                      ),
                    );
                  }).toList();
                },
              )
            ],
          ),
          body: ListView(
            children: [
              Container(
                height: 150.h,
                color: kBlueBackgroundColor,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            overflow: Overflow.visible,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50.h),
                                child: Parent(
                                    style: ParentStyle()
                                      ..height(100.h)
                                      ..width(100.h)
                                      ..borderRadius(all: 12.h)
                                      ..background.color(Colors.white),
                                    child: FutureBuilder<String>(
                                        future: getUserPhoto(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: userPhoto);
                                          } else {
                                            return Icon(
                                              LineAwesomeIcons.user_1,
                                              color: kBlueBackgroundColor,
                                              size: 90.h,
                                            );
                                          }
                                        })),
                              ),
                              Positioned(
                                bottom: 0.h,
                                right: -20.h,
                                child: GestureDetector(
                                  onTap: () async {
                                    await getImage(context);
                                  },
                                  child: Parent(
                                    style: ParentStyle()
                                      ..width(50.h)
                                      ..height(50.h)
                                      ..background.color(Colors.white)
                                      ..borderRadius(all: 50.h),
                                    child: Center(
                                      child: Icon(
                                        LineAwesomeIcons.camera,
                                        size: 40.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt(this.widget.username,
                                  style: TxtStyle()
                                    ..fontWeight(FontWeight.w500)
                                    ..textColor(Colors.white)
                                    ..fontSize(25.sp)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocBuilder<JobsPendingCubit, JobsPendingState>(
                builder: (context, state) {
                  return state.map(
                      initial: (_) => Container(),
                      loading: (_) => BonyezaProfileButtons(
                            backGroundColor: Colors.white,
                            textColor: Colors.black87,
                            text: 'Pending Jobs',
                            number: ' ',
                            borderRadius: 15.h,
                          ),
                      success: (state) {
                        final pendingJobs = state.pendingJobs;

                        return BonyezaProfileButtons(
                          backGroundColor: Colors.white,
                          textColor: Colors.black87,
                          text: 'Pending Jobs',
                          number: pendingJobs.noJobsPending.toString(),
                          borderRadius: 15.h,
                          onButtonPressed: () {
                            ExtendedNavigator.of(context).push(
                                Routes.jobsPendingDetailsPage,
                                arguments: JobsPendingDetailsPageArguments(
                                    title: 'Pending Jobs',
                                    listPendingJobs: pendingJobs.pendingJobs));
                          },
                        );
                      },
                      failure: (_) => Container());
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocBuilder<JobsInProgressCubit, JobsInProgressState>(
                builder: (context, state) {
                  return state.map(
                      initial: (_) => Container(),
                      loading: (_) => BonyezaProfileButtons(
                            backGroundColor: Colors.white,
                            textColor: Colors.black87,
                            text: 'Jobs In Progress',
                            number: ' ',
                            borderRadius: 15.h,
                          ),
                      success: (state) {
                        final jobsInProgress = state.jobsInProgress;

                        return BonyezaProfileButtons(
                          backGroundColor: Colors.white,
                          textColor: Colors.black87,
                          text: 'Jobs In Progress',
                          number: jobsInProgress.noJobsInProgress.toString(),
                          borderRadius: 15.h,
                          onButtonPressed: () {
                            ExtendedNavigator.of(context).push(
                              Routes.jobsInProgressDetailsPage,
                              arguments: JobsInProgressDetailsPageArguments(
                                  title: 'Jobs In Progress',
                                  inProgressJobs:
                                      jobsInProgress.inProgressJobs),
                            );
                          },
                        );
                      },
                      failure: (_) => Container());
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocBuilder<JobsCompletedCubit, JobsCompletedState>(
                builder: (context, state) {
                  return state.map(
                      initial: (_) => Container(),
                      loading: (_) => BonyezaProfileButtons(
                            backGroundColor: Colors.white,
                            textColor: Colors.black87,
                            text: 'Jobs Completed',
                            number: ' ',
                            borderRadius: 15.h,
                          ),
                      success: (state) {
                        final jobsCompleted = state.completedJobs;

                        return BonyezaProfileButtons(
                          backGroundColor: Colors.white,
                          textColor: Colors.black87,
                          text: 'Jobs Completed',
                          number: jobsCompleted.noJobsCompleted.toString(),
                          borderRadius: 15.h,
                          onButtonPressed: () {
                            ExtendedNavigator.of(context).push(
                                Routes.jobsCompletedDetailsPage,
                                arguments: JobsCompletedDetailsPageArguments(
                                    title: 'Jobs Completed',
                                    completedJobs:
                                        jobsCompleted.completedJobs));
                          },
                        );
                      },
                      failure: (_) => Container());
                },
              )
            ],
          ),
        ));
  }

  Future<void> getImage(BuildContext context) async {
    final UpdateUserProfileCubit updateUserProfileCubit =
        BlocProvider.of<UpdateUserProfileCubit>(context);
    PickedFile pickedFile;
    try {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    } on Exception catch (e) {
      print(e.toString());
    }
    if (!mounted) return;

    setState(() {
      _image = File(pickedFile.path);
    });
    updateUserProfileCubit.photoChanged(_image);
    updateUserProfileCubit.updateProfilePic();
  }

  Future<void> updateImage() async {
    String userPic = await getUserPhoto();

    setState(() {
      userPhoto = userPic;
    });
  }

  Future<String> getUserPhoto() async {
    final pref = await SharedPreferences.getInstance();
    String username = pref.getString(USER_PHOTO_URL);
    return username;
  }

  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ??
          PermissionStatus.undetermined;
    } else {
      return permission;
    }
  }

  void choiceAction(String choice, AuthCubit authCubit, BuildContext context) {
    if (choice == Constants.UpdateProfile) {
      ExtendedNavigator.of(context).push(Routes.updateProfilePage);
    } else if (choice == Constants.SignOut) {
      authCubit.logOut();
    } else if (choice == Constants.PushNotifications) {
      ExtendedNavigator.of(context).push(Routes.pushNotificationPage);
    } else if (choice == Constants.InviteFriends) {
      _getPermission().then((permissionStatus) {
        if (permissionStatus == PermissionStatus.granted) {
          ExtendedNavigator.of(context).push(Routes.contactsPage);
        } else {
          Flushbar(
            title: 'Permissions error',
            message:
                'Please enable contacts access permission in system settings',
            margin: EdgeInsets.all(20.h),
            flushbarPosition: FlushbarPosition.TOP,
            duration: Duration(seconds: 3),
            isDismissible: true,
            backgroundColor: Color(0xFFFD9726),
            borderRadius: 15.h,
          ).show(context);
        }
      });
    }
  }
}

class BonyezaProfileButtons extends StatelessWidget {
  const BonyezaProfileButtons({
    Key key,
    this.backGroundColor,
    this.textColor,
    this.text,
    this.number,
    this.onButtonPressed,
    this.height = 60.0,
    this.margin = 20,
    this.borderRadius = 100.0,
  }) : super(key: key);

  final Color backGroundColor;
  final Color textColor;
  final String text;
  final String number;
  final Function onButtonPressed;
  final double margin;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Parent(
        style: ParentStyle()
          ..height(this.height.h)
          ..margin(horizontal: this.margin.h)
          ..background.color(this.backGroundColor)
          ..borderRadius(all: this.borderRadius)
          ..ripple(true)
          ..boxShadow(
              color: kBoxShadowColor.shade500,
              offset: kBoxShadowOffset,
              blur: kBoxShadowBlur)
          ..alignmentContent.center(),
        gesture: Gestures()..onTap(this.onButtonPressed),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Txt(
                this.text,
                style: TxtStyle()
                  ..fontWeight(FontWeight.w500)
                  ..fontSize(21.sp)
                  ..textColor(this.textColor),
              ),
              Txt(
                this.number ?? " ",
                style: TxtStyle()
                  ..fontWeight(FontWeight.w500)
                  ..fontSize(21.sp)
                  ..textColor(this.textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
