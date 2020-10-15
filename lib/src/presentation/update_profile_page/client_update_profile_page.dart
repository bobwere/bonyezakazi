import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/update_user_profile_cubit/update_user_profile_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/registration_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/update_profile_widgets.dart';
import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:smart_form/smart_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientUpdateProfilePage extends StatefulWidget {
  const ClientUpdateProfilePage({Key key}) : super(key: key);

  @override
  _ClientUpdateProfilePageState createState() =>
      _ClientUpdateProfilePageState();
}

class _ClientUpdateProfilePageState extends State<ClientUpdateProfilePage> {
  final _formKey = GlobalKey<SmartFormState>();
  @override
  Widget build(BuildContext context) {
    UpdateUserProfileCubit updateUserProfileCubit =
        BlocProvider.of<UpdateUserProfileCubit>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: kBlueBackgroundColor,
        centerTitle: true,
        title: Txt(
          'Update Profile',
          style: kAppBarTxtStyle,
        ),
      ),
      body: BlocConsumer<UpdateUserProfileCubit, UpdateUserProfileState>(
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
                  }, (_) {
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
        builder: (context, state) {
          return Stack(
            children: [
              Stack(
                children: [
                  SmartForm(
                    key: _formKey,
                    autovalidate: false,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        UpdateUsernameField(),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            UpdateCountryCodeField(),
                            Expanded(child: UpdatePhoneNumberField()),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        BonyezaButton(
                          backGroundColor: kGreenBackgroundColor,
                          textColor: Colors.white,
                          text: 'UPDATE',
                          onButtonPressed: () {
                            if (_formKey.currentState.validate()) {
                              updateUserProfileCubit.updateClientProfile();
                            } else {
                              Flushbar(
                                title: 'Unable to update details',
                                message:
                                    'Provide the missing details to proceed',
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
                        SizedBox(
                          height: 20.h,
                        ),
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: 260.h,
                    left: 220.w,
                    child: BlocBuilder<UpdateUserProfileCubit,
                        UpdateUserProfileState>(
                      builder: (context, state) {
                        if (state.isSubmitting) {
                          return Container(
                            height: 50.h,
                            width: 50.h,
                            child: LoadingIndicator(
                                indicatorType: Indicator.ballTrianglePath,
                                color: kGreenBackgroundColor),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
              SubmittingOverlay(isSubmitting: state.isSubmitting)
            ],
          );
        },
      ),
    );
  }
}
