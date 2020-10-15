import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/job_journey/client_job_description_cubit/job_description_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/registration_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/booking_page_widgets.dart';
import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:smart_form/smart_form.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key key, @required this.serviceProvider})
      : super(key: key);
  final ServiceProvider serviceProvider;

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  GlobalKey<SmartFormState> _formKey = GlobalKey<SmartFormState>();

  @override
  Widget build(BuildContext context) {
    JobDescriptionCubit jobDescriptionCubit =
        BlocProvider.of<JobDescriptionCubit>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueBackgroundColor,
        elevation: 3.h,
        title: Txt('Book Now', style: kAppBarTxtStyle),
        centerTitle: true,
      ),
      body: BlocListener<JobDescriptionCubit, JobDescriptionState>(
        listener: (context, state) {
          state.bookingFailureOrSuccessOption.fold(
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
                  }, (r) {
                    ExtendedNavigator.of(context).pop();
                    Flushbar(
                      title: 'Enquiry Sent Successfully',
                      message:
                          'keep in touch with ${widget.serviceProvider.username} from your inbox',
                      margin: EdgeInsets.all(20.h),
                      flushbarPosition: FlushbarPosition.TOP,
                      duration: Duration(seconds: 4),
                      isDismissible: true,
                      backgroundColor: Colors.green,
                      borderRadius: 15.h,
                    ).show(context);
                  }));
        },
        child: Stack(
          children: [
            SmartForm(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: 20.h),
                  BookingTitleField(),
                  SizedBox(height: 20.h),
                  BookingDescriptionField(),
                  SizedBox(height: 20.h),
                  BookingDatePicker(),
                  SizedBox(height: 20.h),
                  BookingTimePicker(),
                  SizedBox(height: 20.h),
                  LocationBookingDropDown(items: [...locations]),
                  BookingMultipleImagePicker(),
                  SizedBox(
                    height: 20.h,
                  ),
                  BonyezaButton(
                    backGroundColor: kGreenBackgroundColor,
                    textColor: Colors.white,
                    text: "ENQUIRY",
                    onButtonPressed: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      final _pref = await SharedPreferences.getInstance();
                      String userTypeID = _pref.getString(USER_TYPE_ID);
                      if (userTypeID == '4') {
                        Flushbar(
                          title: 'Unable to make a booking',
                          message: 'Login as a client to book services',
                          margin: EdgeInsets.all(20.h),
                          flushbarPosition: FlushbarPosition.TOP,
                          duration: Duration(seconds: 3),
                          isDismissible: true,
                          backgroundColor: Color(0xFFFD9726),
                          borderRadius: 15.h,
                        ).show(context);
                      } else {
                        if (_formKey.currentState.validate()) {
                          jobDescriptionCubit
                              .workerIDChanged(widget.serviceProvider.id);
                          jobDescriptionCubit.workerImageURLChanged(
                              widget.serviceProvider.photo);
                          jobDescriptionCubit.workerNameChanged(
                              widget.serviceProvider.username);
                          jobDescriptionCubit.clientJobDescriptionSubmission();
                        } else {
                          Flushbar(
                            title: 'Unable to make a booking',
                            message: 'Provide the missing details to proceed',
                            margin: EdgeInsets.all(20.h),
                            flushbarPosition: FlushbarPosition.TOP,
                            duration: Duration(seconds: 3),
                            isDismissible: true,
                            backgroundColor: Color(0xFFFD9726),
                            borderRadius: 15.h,
                          ).show(context);
                        }
                      }
                    },
                    borderRadius: 15.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ]),
              ),
            ),
            Positioned(
              bottom: 215.h,
              left: 220.w,
              child: BlocBuilder<JobDescriptionCubit, JobDescriptionState>(
                builder: (context, state) {
                  if (state.isSubmitting) {
                    return Container(
                      height: 50.h,
                      width: 50.h,
                      child: LoadingIndicator(
                          indicatorType: Indicator.ballTrianglePath,
                          color: kBlueBackgroundColor),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            BlocBuilder<JobDescriptionCubit, JobDescriptionState>(
              builder: (context, state) {
                if (state.isSubmitting) {
                  return SubmittingOverlay(isSubmitting: state.isSubmitting);
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
