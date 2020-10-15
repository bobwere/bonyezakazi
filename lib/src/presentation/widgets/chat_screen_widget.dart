import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/src/application/job_journey/job_journey_cubit/job_journey_cubit.dart';
import 'package:bonyeza_kazi/src/application/jobs_details/jobs_pending_cubit/jobs_pending_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/chatroom_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/chat/models/message_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;

Widget buildJobEnquiryMessage(
    Message message, BuildContext context, ChatRoom chatRoom) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("yyyy-MM-dd hh:mm").format(timeStamp);
  JobJourneyCubit jobJourneyCubit = BlocProvider.of<JobJourneyCubit>(context);
  BlocProvider.of<JobsPendingCubit>(context)..getPendingJobs();

  return Container(
    margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: kServerOrNotMeMessageBoxDecoration,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(time, style: timeTextStyle),
        SizedBox(height: 10.h),
        Text('Requesting Your Services', style: kMessageHeadingTextStyle),
        SizedBox(height: 5.h),
        Text("On ${message.bookingDate}", style: kMessageBookingDateTimeStyle),
        Text("At ${message.bookingTime}", style: kMessageBookingDateTimeStyle),
        SizedBox(height: 10.h),
        Text('Job Description', style: kMessageHeadingTextStyle),
        Text(message.bookingDescription, style: kMessageBodyTextStyle),
        SizedBox(height: 10.h),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15.h)),
          child: SizedBox(
            width: 250.h,
            height: 250.h,
            child: CachedNetworkImage(
              fadeOutDuration: const Duration(milliseconds: 500),
              fadeInDuration: const Duration(milliseconds: 500),
              imageUrl: message.bookingImage[0],
              placeholder: (context, url) {
                return Container(
                  color: randomChoice<Color>(kPlaceHolderColors),
                );
              },
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        BlocBuilder<JobJourneyCubit, JobJourneyState>(
          builder: (context, state) {
            if (state == JobJourneyState.loading()) {
              return Container(
                height: 60.h,
                width: 150.h,
                child: Center(
                  child: Container(
                    height: 50.h,
                    width: 50.h,
                    child: load.LoadingIndicator(
                        indicatorType: load.Indicator.ballTrianglePath,
                        color: kGreenBackgroundColor),
                  ),
                ),
              );
            } else {
              return message.serverMessageStatus == SERVER_MSG_STATUS_ENQUIRY
                  ? Row(
                      children: [
                        Expanded(
                          child: FlatButton(
                            color: kRedBackgroundColor.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.h),
                            ),
                            onPressed: () {
                              jobJourneyCubit.spDeclinesJob(
                                  message.workID, chatRoom, message);
                            },
                            child: Text('DECLINE',
                                style: kMessageAcceptDenyTextSytle),
                          ),
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        Expanded(
                          child: FlatButton(
                            color: kGreenBackgroundColor.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.h),
                            ),
                            onPressed: () {
                              jobJourneyCubit.spAcceptsJob(
                                  message.workID, chatRoom, message);
                            },
                            child: Text('CONFIRM',
                                style: kMessageAcceptDenyTextSytle),
                          ),
                        ),
                      ],
                    )
                  : Container();
            }
          },
        )
      ],
    ),
  );
}

Widget buildNormalMessage(Message message, bool isMe, BuildContext context) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("yyyy-MM-dd hh:mm").format(timeStamp);
  return Container(
    margin: isMe
        ? EdgeInsets.only(top: 10.h, bottom: 10.h, left: 80.h)
        : EdgeInsets.only(top: 10.h, bottom: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: BoxDecoration(
        color: isMe
            ? kBlueBackgroundColor.withOpacity(0.8)
            : kBlueBackgroundColor.withOpacity(0.1),
        borderRadius: isMe ? isMeBorderRadius : isNotMeBorderRadius),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(time.toString(), style: isMe ? notMetimeTextStyle : timeTextStyle),
        SizedBox(height: 10.h),
        Text(message.text,
            style: isMe ? kNotMeMessageBodyTextStyle : kMessageBodyTextStyle),
      ],
    ),
  );
}

Widget buildEnquirySentMessage(
    Message message, bool isMe, BuildContext context) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("yyyy-MM-dd hh:mm").format(timeStamp);
  return Container(
    margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.4),
        borderRadius: isNotMeBorderRadius),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(time, style: timeTextStyle),
        SizedBox(height: 10.h),
        Text(message.bookingText, style: kMessageHeadingTextStyle),
        SizedBox(height: 10.h),
        Text("Enquiry Sent", style: kMessageBodyTextStyle),
      ],
    ),
  );
}

Widget buildBookingConfirmedMessage(Message message, bool isMe,
    BuildContext context, ChatRoom chatRoom, String userTypeID) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("yyyy-MM-dd hh:mm").format(timeStamp);

  return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.4),
          borderRadius: isNotMeBorderRadius),
      child: userTypeID == '5'
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(time, style: timeTextStyle),
                SizedBox(height: 10.h),
                Text(message.bookingText, style: kMessageHeadingTextStyle),
                SizedBox(height: 10.h),
                Text("Booking confirmed", style: kMessageHeadingTextStyle),
                SizedBox(height: 10.h),
                Text(
                    "Go ahead and negotiate the price and commencement of this job",
                    style: kMessageBodyTextStyle),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(time, style: timeTextStyle),
                SizedBox(height: 10.h),
                Text(message.bookingText, style: kMessageHeadingTextStyle),
                SizedBox(height: 10.h),
                Text("Booking confirmation sent",
                    style: kMessageHeadingTextStyle),
                SizedBox(height: 20.h),
                Text(
                    "Go Ahead and negotiate the price for this job and once you have completed the job click the button below to upload images of work done",
                    style: kMessageBodyTextStyle),
                SizedBox(height: 10.h),
                message.serverMessageType ==
                            SERVER_MSG_TYPE_BOOKING_CONFIRMED &&
                        message.serverMessageStatus ==
                            SERVER_MSG_STATUS_BOOKING_CONFIRMED
                    ? FlatButton(
                        color: kGreenBackgroundColor.withOpacity(0.6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.h),
                        ),
                        onPressed: () {
                          ExtendedNavigator.of(context).push(
                              Routes.workCompletedWidget,
                              arguments: WorkCompletedWidgetArguments(
                                  chatRoom: chatRoom,
                                  isMe: isMe,
                                  message: message));
                        },
                        child: Text('WORK COMPLETED',
                            style: kMessageAcceptDenyTextSytle),
                      )
                    : Container(),
              ],
            ));
}

Widget buildBookingDeclinedMessage(
    Message message, bool isMe, BuildContext context) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("yyyy-MM-dd hh:mm").format(timeStamp);

  return Container(
    margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.4),
        borderRadius: isNotMeBorderRadius),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(time, style: timeTextStyle),
        SizedBox(height: 10.h),
        Text(message.bookingText, style: kMessageHeadingTextStyle),
        SizedBox(height: 10.h),
        Text("Booking Declined", style: kMessageBodyTextStyle),
      ],
    ),
  );
}

Widget buildChargesMessage(Message message, bool isMe, BuildContext context) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("yyyy-MM-dd hh:mm").format(timeStamp);
  return Container(
    margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.4),
        borderRadius: isNotMeBorderRadius),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(time, style: timeTextStyle),
        SizedBox(height: 10.h),
        Text("Charges: ", style: kMessageHeadingTextStyle),
      ],
    ),
  );
}

Widget buildWorkCompletedMessage(Message message, bool isMe,
    BuildContext context, ChatRoom chatRoom, String userTypeID) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("yyyy-MM-dd hh:mm").format(timeStamp);
  return Container(
    margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.4),
        borderRadius: isNotMeBorderRadius),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(time, style: timeTextStyle),
        SizedBox(height: 10.h),
        Text(message.bookingText, style: kMessageHeadingTextStyle),
        SizedBox(height: 10.h),
        Text("Work Completed", style: kMessageBodyTextStyle),
        SizedBox(height: 10.h),
        userTypeID == '5' &&
                message.serverMessageStatus == SERVER_MSG_STATUS_UNRATED
            ? Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      color: kGreenBackgroundColor.withOpacity(0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.h),
                      ),
                      onPressed: () {
                        ExtendedNavigator.of(context).push(
                            Routes.sendRatingWidget,
                            arguments: SendRatingWidgetArguments(
                                chatRoom: chatRoom,
                                isMe: isMe,
                                message: message));
                      },
                      child: Text('LEAVE A RATING',
                          style: kMessageAcceptDenyTextSytle),
                    ),
                  ),
                ],
              )
            : Container()
      ],
    ),
  );
}

Widget buildLeaveAReviewMessage(
    Message message, bool isMe, BuildContext context, String userTypeID) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("yyyy-MM-dd hh:mm").format(timeStamp);
  return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.4),
          borderRadius: isNotMeBorderRadius),
      child: userTypeID == '5'
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(time, style: timeTextStyle),
                SizedBox(height: 10.h),
                Text(message.bookingText, style: kMessageHeadingTextStyle),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        color: kGreenBackgroundColor.withOpacity(0.6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.h),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20.0)), //this right here
                                  child: Container(
                                    height: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: ' '),
                                          ),
                                          SizedBox(
                                            width: 320.0,
                                            child: RaisedButton(
                                              onPressed: () {},
                                              child: Text(
                                                "SEND REVIEW",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              color: const Color(0xFF1BC0C5),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Text('LEAVE A REVIEW',
                            style: kMessageAcceptDenyTextSytle),
                      ),
                    ),
                  ],
                )
              ],
            )
          : Container());
}

Widget buildPaymentConfirmedMessage(
    Message message, bool isMe, BuildContext context) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("yyyy-MM-dd hh:mm").format(timeStamp);
  return Container(
    margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.4),
        borderRadius: isNotMeBorderRadius),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(time, style: timeTextStyle),
        SizedBox(height: 10.h),
        Text("Payment Confirmed", style: kMessageHeadingTextStyle),
      ],
    ),
  );
}

Widget buildImageMessage(Message message, bool isMe, BuildContext context) {
  final DateTime timeStamp =
      DateTime.fromMillisecondsSinceEpoch(int.parse(message.time));
  final time = DateFormat("yyyy-MM-dd hh:mm").format(timeStamp);
  return Container(
    margin: isMe
        ? EdgeInsets.only(top: 10.h, bottom: 10.h, left: 80.h)
        : EdgeInsets.only(top: 10.h, bottom: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: BoxDecoration(
        color: isMe
            ? kBlueBackgroundColor.withOpacity(0.8)
            : kBlueBackgroundColor.withOpacity(0.1),
        borderRadius: isMe ? isMeBorderRadius : isNotMeBorderRadius),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(time, style: isMe ? notMetimeTextStyle : timeTextStyle),
        SizedBox(height: 10.h),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15.h)),
          child: SizedBox(
            width: 250.h,
            height: 250.h,
            child: CachedNetworkImage(
              fadeOutDuration: const Duration(milliseconds: 500),
              fadeInDuration: const Duration(milliseconds: 500),
              imageUrl: message.imageUrl,
              placeholder: (context, url) {
                return Container(
                  color: randomChoice<Color>(kPlaceHolderColors),
                );
              },
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ),
  );
}
