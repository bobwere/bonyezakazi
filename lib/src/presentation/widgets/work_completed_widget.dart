import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/job_journey/work_completed_cubit/work_completed_cubit.dart';
import 'package:bonyeza_kazi/src/application/jobs_details/jobs_completed_cubit/jobs_completed_cubit.dart';
import 'package:bonyeza_kazi/src/application/jobs_details/jobs_in_progress_cubit/jobs_in_progress_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/message_model.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/registration_page_widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:smart_form/smart_form.dart';

class WorkCompletedWidget extends StatefulWidget {
  const WorkCompletedWidget({Key key, this.chatRoom, this.isMe, this.message})
      : super(key: key);

  final Message message;
  final bool isMe;
  final ChatRoom chatRoom;

  @override
  _WorkCompletedWidgetState createState() => _WorkCompletedWidgetState();
}

class _WorkCompletedWidgetState extends State<WorkCompletedWidget> {
  final _formKey = GlobalKey<SmartFormState>();

  @override
  Widget build(BuildContext context) {
    WorkCompletedCubit workCompletedCubit =
        BlocProvider.of<WorkCompletedCubit>(context);
    JobsCompletedCubit jobsCompletedCubit =
        BlocProvider.of<JobsCompletedCubit>(context);
    JobsInProgressCubit jobsInProgressCubit =
        BlocProvider.of<JobsInProgressCubit>(context);

    return BlocConsumer<WorkCompletedCubit, WorkCompletedState>(
      listener: (context, state) {
        state.sendingFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold((failure) {
                  failure.map(serverError: (_) {
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
                  }, noInternet: (_) {
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
                  });
                }, (success) {
                  ExtendedNavigator.of(context).pop();
                  Flushbar(
                    title: 'Completed',
                    message: 'Images Sent Successfully',
                    margin: EdgeInsets.all(20.h),
                    flushbarPosition: FlushbarPosition.TOP,
                    duration: Duration(seconds: 4),
                    isDismissible: true,
                    backgroundColor: Colors.green,
                    borderRadius: 15.h,
                  ).show(context);
                  jobsInProgressCubit.getJobsInProgress();
                  jobsCompletedCubit.getJobsCompleted();
                }));
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Txt("Work Completed", style: kAppBarTxtStyle),
                centerTitle: true,
                backgroundColor: kBlueBackgroundColor,
                elevation: 3.h,
              ),
              body: Center(
                child: SmartForm(
                  key: _formKey,
                  autovalidate: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Txt(
                        'Add images of the work done',
                        style: kAppBarTxtStyle.clone()
                          ..fontSize(23.sp)
                          ..textColor(Colors.black87),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      WorkCompletedMultipleImagePicker(),
                      SizedBox(
                        height: 10.h,
                      ),
                      BonyezaButton(
                        backGroundColor: kGreenBackgroundColor,
                        textColor: Colors.white,
                        text: 'SUBMIT',
                        onButtonPressed: () {
                          if (_formKey.currentState.validate()) {
                            workCompletedCubit.spCompletesJob(
                                widget.message.workID,
                                widget.chatRoom,
                                widget.message);
                          } else {
                            Flushbar(
                              title: 'Unable to submit',
                              message: 'Provide the missing details to proceed',
                              margin: EdgeInsets.all(20.h),
                              flushbarPosition: FlushbarPosition.TOP,
                              duration: Duration(seconds: 3),
                              isDismissible: true,
                              backgroundColor: Color(0xFFFD9726),
                              borderRadius: 15.h,
                            ).show(context);
                          }
                        },
                      ),
                      SizedBox(height: 100.h),
                      state.isSubmitting
                          ? Center(
                              child: Container(
                                height: 50.h,
                                width: 50.h,
                                child: load.LoadingIndicator(
                                    indicatorType:
                                        load.Indicator.ballTrianglePath,
                                    color: kGreenBackgroundColor),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
            SubmittingOverlay(isSubmitting: state.isSubmitting)
          ],
        );
      },
    );
  }
}

class WorkCompletedMultipleImagePicker extends StatefulWidget {
  WorkCompletedMultipleImagePicker({Key key}) : super(key: key);

  @override
  _WorkCompletedMultipleImagePickerState createState() =>
      _WorkCompletedMultipleImagePickerState();
}

class _WorkCompletedMultipleImagePickerState
    extends State<WorkCompletedMultipleImagePicker> {
  List<Asset> images;

  @override
  void initState() {
    super.initState();
    images = [];
  }

  Widget buildGridView(BuildContext context) {
    return SizedBox(
      height: images.length == 0 ? 0.h : 120.h,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 20.h),
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          Asset asset = images[index];
          return Container(
            margin: EdgeInsets.only(right: 20.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.h),
              child: Container(
                child: AssetThumb(
                  asset: asset,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> loadAssets(BuildContext context) async {
    WorkCompletedCubit workCompletedCubit =
        BlocProvider.of<WorkCompletedCubit>(context);
    List<Asset> resultList = List<Asset>();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 8,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#0095D8",
          actionBarTitle: "Select Images",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#0095D8",
        ),
      );
    } on Exception catch (e) {}

    if (!mounted) return;

    setState(() {
      images = resultList;
      workCompletedCubit.workDonePhotosChanged(images);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartFormField(
        initialValue: [],
        autovalidate: true,
        validator: (value) {
          if (value.length == 0) return 'please add atleast one photo';
        },
        builder: (state) {
          return Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    state.errorText ?? '',
                    style: TextStyle(
                        color: Theme.of(context).errorColor, fontSize: 12),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.h),
                  child: GestureDetector(
                    onTap: () async {
                      await loadAssets(context);
                      state.didChange(images);
                      state.validate();
                    },
                    child: Container(
                      height: 100.h,
                      width: 100.h,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                          'Add Photos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 21.h,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
                buildGridView(context)
              ],
            ),
          );
        });
  }
}
