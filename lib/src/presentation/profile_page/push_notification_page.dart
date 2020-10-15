import 'package:bonyeza_kazi/common/config/api.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/notifications/notifications_cubit/notification_cubit.dart';
import 'package:bonyeza_kazi/src/application/notifications/toggle_notifications_cubit/toggle_notifications_cubit.dart';
import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;

class PushNotificationPage extends StatelessWidget {
  const PushNotificationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ToggleNotificationStatusCubit,
        ToggleNotificationStatusState>(
      listener: (context, state) {
        state.sendingFailureOrSuccessOption.fold(
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
                }, (_) {}));
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 3.h,
          backgroundColor: kBlueBackgroundColor,
          centerTitle: true,
          title: Txt(
            'Push Notifications',
            style: kAppBarTxtStyle,
          ),
        ),
        body: FutureBuilder<String>(
            future: getUserTypeID(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data == '5'
                    ? ClientPushNotificationPage()
                    : SPPushNotificationPage();
              } else {
                return Container();
              }
            }),
      ),
    );
  }

  Future<String> getUserTypeID() async {
    final pref = await SharedPreferences.getInstance();
    String userTypeID = pref.getString(USER_TYPE_ID);
    return userTypeID;
  }
}

class ClientPushNotificationPage extends StatelessWidget {
  const ClientPushNotificationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToggleNotificationStatusCubit toggleNotificationStatusCubit =
        BlocProvider.of<ToggleNotificationStatusCubit>(context);
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        return state.map(
            initial: (_) => Container(),
            loading: (_) => Center(
                  child: Container(
                    height: 50.h,
                    width: 50.h,
                    child: load.LoadingIndicator(
                        indicatorType: load.Indicator.ballTrianglePath,
                        color: kBlueBackgroundColor),
                  ),
                ),
            success: (state) {
              final notification = state.notification;
              return Column(
                children: [
                  NotificationTile(
                      title: 'Inbox Messages',
                      status: notification.inboxmessages,
                      onTap: (status) {
                        toggleNotificationStatusCubit
                            .inboxmessageChanged(!status);
                        print('called');
                      }),
                  NotificationTile(
                      title: 'Job Completed Messages',
                      status: notification.jobcompletedmessages,
                      onTap: (status) {
                        toggleNotificationStatusCubit
                            .jobcompletedmessageChanged(!status);
                      }),
                  NotificationTile(
                      title: 'Job Confirmed Messages',
                      status: notification.jobcompletedmessages,
                      onTap: (status) {
                        toggleNotificationStatusCubit
                            .bookingconfirmedmessageChanged(!status);
                      }),
                  NotificationTile(
                      title: 'Job Declined Messages',
                      status: notification.jobcompletedmessages,
                      onTap: (status) {
                        toggleNotificationStatusCubit
                            .bookingdeclinedmessageChanged(!status);
                      }),
                ],
              );
            },
            failure: (_) => Container());
      },
    );
  }
}

class SPPushNotificationPage extends StatelessWidget {
  const SPPushNotificationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToggleNotificationStatusCubit toggleNotificationStatusCubit =
        BlocProvider.of<ToggleNotificationStatusCubit>(context);
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        return state.map(
            initial: (_) => Container(),
            loading: (_) => Center(
                  child: Container(
                    height: 50.h,
                    width: 50.h,
                    child: load.LoadingIndicator(
                        indicatorType: load.Indicator.ballTrianglePath,
                        color: kBlueBackgroundColor),
                  ),
                ),
            success: (state) {
              final notification = state.notification;
              return Column(
                children: [
                  NotificationTile(
                      title: 'Inbox Messages',
                      status: notification.inboxmessages,
                      onTap: (status) {
                        toggleNotificationStatusCubit
                            .inboxmessageChanged(!status);
                      }),
                  NotificationTile(
                      title: 'Job Request Messages',
                      status: notification.jobrequestmessages,
                      onTap: (status) {
                        toggleNotificationStatusCubit
                            .jobrequestmessageChanged(!status);
                      }),
                  NotificationTile(
                      title: 'Left A Review Messages',
                      status: notification.inboxmessages,
                      onTap: (status) {
                        toggleNotificationStatusCubit
                            .leaveareviewmessageChanged(!status);
                      }),
                ],
              );
            },
            failure: (_) => Container());
      },
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile(
      {Key key,
      @required this.title,
      @required this.status,
      @required this.onTap})
      : super(key: key);
  final String title;
  final bool status;
  final void Function(bool value) onTap;

  @override
  Widget build(BuildContext context) {
    var isSwitched = status;
    return ListTile(
      leading: Txt(
        title,
        style: TxtStyle()
          ..fontFamily('Avenir')
          ..fontWeight(FontWeight.w500)
          ..fontSize(24.sp)
          ..textColor(Colors.black87),
      ),
      trailing: Switch(
        value: isSwitched,
        onChanged: (value) => onTap(!value),
        activeTrackColor: kBlueBackgroundColor.withOpacity(0.5),
        activeColor: kBlueBackgroundColor,
      ),
    );
  }
}
