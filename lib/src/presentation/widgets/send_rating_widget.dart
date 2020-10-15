import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/job_journey/client_rates_job_done_cubit/client_rates_job_done_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/message_model.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/registration_page_widgets.dart';
import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_form/smart_form.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;

class SendRatingWidget extends StatefulWidget {
  const SendRatingWidget({Key key, this.chatRoom, this.isMe, this.message})
      : super(key: key);

  final Message message;
  final bool isMe;
  final ChatRoom chatRoom;

  @override
  _SendRatingWidgetState createState() => _SendRatingWidgetState();
}

class _SendRatingWidgetState extends State<SendRatingWidget> {
  final _formKey = GlobalKey<SmartFormState>();
  @override
  Widget build(BuildContext context) {
    ClientRatesJobDoneCubit clientRatesJobDoneCubit =
        BlocProvider.of<ClientRatesJobDoneCubit>(context);

    return BlocConsumer<ClientRatesJobDoneCubit, ClientRatesJobDoneState>(
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
                    message: 'Rating Sent Successfully',
                    margin: EdgeInsets.all(20.h),
                    flushbarPosition: FlushbarPosition.TOP,
                    duration: Duration(seconds: 4),
                    isDismissible: true,
                    backgroundColor: Colors.green,
                    borderRadius: 15.h,
                  ).show(context);
                }));
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Txt("Rating", style: kAppBarTxtStyle),
                centerTitle: true,
                backgroundColor: kBlueBackgroundColor,
                elevation: 10.h,
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
                        'Rate the work done',
                        style: kAppBarTxtStyle.clone()
                          ..textColor(Colors.black87)
                          ..textAlign.center(),
                      ),
                      Txt(
                        'From 1 to 5 Star',
                        style: kAppBarTxtStyle.clone()
                          ..textColor(Colors.black87)
                          ..textAlign.center(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SmoothStarRating(
                        starCount: 5,
                        isReadOnly: false,
                        size: 50.sp,
                        allowHalfRating: true,
                        rating: 0.0,
                        color: kYellowStarColor,
                        borderColor: kYellowStarColor,
                        onRated: (value) {
                          clientRatesJobDoneCubit
                              .ratingChanged(value.toString());
                        },
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      BonyezaButton(
                        backGroundColor: kGreenBackgroundColor,
                        textColor: Colors.white,
                        text: 'SUBMIT',
                        onButtonPressed: () {
                          clientRatesJobDoneCubit.clientRatesJobDone(
                              widget.message.workID,
                              widget.chatRoom,
                              widget.message);
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
