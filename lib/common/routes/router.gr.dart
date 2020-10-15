// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../src/infrastructure/categories/models/service_provider_search_model.dart';
import '../../src/infrastructure/chat/models/chatroom_model.dart';
import '../../src/infrastructure/chat/models/message_model.dart';
import '../../src/infrastructure/service_provider/model/sp_completed_jobs_model.dart';
import '../../src/infrastructure/service_provider/model/sp_in_progress_jobs_model.dart';
import '../../src/infrastructure/service_provider/model/sp_pending_jobs_model.dart';
import '../../src/presentation/list_of_service_providers_page/list_of_service_providers.dart';
import '../../src/presentation/login_page/login_page.dart';
import '../../src/presentation/messages_page/chat_screen_page.dart';
import '../../src/presentation/profile_page/contacts_page.dart';
import '../../src/presentation/profile_page/jobs_detail_page.dart';
import '../../src/presentation/profile_page/push_notification_page.dart';
import '../../src/presentation/registration_page/registration_page.dart';
import '../../src/presentation/service_provider_detail_page/service_provider_detail_page.dart';
import '../../src/presentation/update_profile_page/update_profile_page.dart';
import '../../src/presentation/widgets/auth_widget.dart';
import '../../src/presentation/widgets/send_rating_widget.dart';
import '../../src/presentation/widgets/service_provider_detail_page_widgets/booking_page.dart';
import '../../src/presentation/widgets/work_completed_widget.dart';
import 'page_transitions.dart';

class Routes {
  static const String authWidget = '/';
  static const String loginPage = '/login';
  static const String registrationPage = '/register';
  static const String listOfServiceProviders = '/listofserviceproviders';
  static const String bookingPage = '/bookingpage';
  static const String serviceProviderDetailPage = '/serviceproviderdetailpage';
  static const String chatScreen = '/chatscreen';
  static const String workCompletedWidget = '/workcompletedwidget';
  static const String sendRatingWidget = '/sendratingwidget';
  static const String jobsPendingDetailsPage = '/jobspendingdetailspage';
  static const String jobsInProgressDetailsPage = '/jobsinprogressdetailspage';
  static const String jobsCompletedDetailsPage = '/jobscompleteddetailspage';
  static const String updateProfilePage = '/updateprofilepage';
  static const String contactsPage = '/contactspage';
  static const String pushNotificationPage = '/pushnotificationpage';
  static const all = <String>{
    authWidget,
    loginPage,
    registrationPage,
    listOfServiceProviders,
    bookingPage,
    serviceProviderDetailPage,
    chatScreen,
    workCompletedWidget,
    sendRatingWidget,
    jobsPendingDetailsPage,
    jobsInProgressDetailsPage,
    jobsCompletedDetailsPage,
    updateProfilePage,
    contactsPage,
    pushNotificationPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.authWidget, page: AuthWidget),
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.registrationPage, page: RegistrationPage),
    RouteDef(Routes.listOfServiceProviders, page: ListOfServiceProviders),
    RouteDef(Routes.bookingPage, page: BookingPage),
    RouteDef(Routes.serviceProviderDetailPage, page: ServiceProviderDetailPage),
    RouteDef(Routes.chatScreen, page: ChatScreen),
    RouteDef(Routes.workCompletedWidget, page: WorkCompletedWidget),
    RouteDef(Routes.sendRatingWidget, page: SendRatingWidget),
    RouteDef(Routes.jobsPendingDetailsPage, page: JobsPendingDetailsPage),
    RouteDef(Routes.jobsInProgressDetailsPage, page: JobsInProgressDetailsPage),
    RouteDef(Routes.jobsCompletedDetailsPage, page: JobsCompletedDetailsPage),
    RouteDef(Routes.updateProfilePage, page: UpdateProfilePage),
    RouteDef(Routes.contactsPage, page: ContactsPage),
    RouteDef(Routes.pushNotificationPage, page: PushNotificationPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    AuthWidget: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AuthWidget(),
        settings: data,
      );
    },
    LoginPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginPage(),
        settings: data,
        transitionsBuilder: fadeThrough,
      );
    },
    RegistrationPage: (data) {
      final args = data.getArgs<RegistrationPageArguments>(
        orElse: () => RegistrationPageArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            RegistrationPage(key: args.key),
        settings: data,
        transitionsBuilder: fadeThrough,
      );
    },
    ListOfServiceProviders: (data) {
      final args = data.getArgs<ListOfServiceProvidersArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ListOfServiceProviders(
          key: args.key,
          title: args.title,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
      );
    },
    BookingPage: (data) {
      final args = data.getArgs<BookingPageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => BookingPage(
          key: args.key,
          serviceProvider: args.serviceProvider,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
    ServiceProviderDetailPage: (data) {
      final args =
          data.getArgs<ServiceProviderDetailPageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ServiceProviderDetailPage(
          key: args.key,
          serviceProvider: args.serviceProvider,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
      );
    },
    ChatScreen: (data) {
      final args = data.getArgs<ChatScreenArguments>(
        orElse: () => ChatScreenArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => ChatScreen(
          chatroomID: args.chatroomID,
          otherUser: args.otherUser,
          unread: args.unread,
          chatroom: args.chatroom,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
      );
    },
    WorkCompletedWidget: (data) {
      final args = data.getArgs<WorkCompletedWidgetArguments>(
        orElse: () => WorkCompletedWidgetArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            WorkCompletedWidget(
          key: args.key,
          chatRoom: args.chatRoom,
          isMe: args.isMe,
          message: args.message,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
    SendRatingWidget: (data) {
      final args = data.getArgs<SendRatingWidgetArguments>(
        orElse: () => SendRatingWidgetArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SendRatingWidget(
          key: args.key,
          chatRoom: args.chatRoom,
          isMe: args.isMe,
          message: args.message,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
    JobsPendingDetailsPage: (data) {
      final args = data.getArgs<JobsPendingDetailsPageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            JobsPendingDetailsPage(
          key: args.key,
          title: args.title,
          listPendingJobs: args.listPendingJobs,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
    JobsInProgressDetailsPage: (data) {
      final args =
          data.getArgs<JobsInProgressDetailsPageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            JobsInProgressDetailsPage(
          key: args.key,
          title: args.title,
          inProgressJobs: args.inProgressJobs,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
    JobsCompletedDetailsPage: (data) {
      final args =
          data.getArgs<JobsCompletedDetailsPageArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            JobsCompletedDetailsPage(
          key: args.key,
          title: args.title,
          completedJobs: args.completedJobs,
        ),
        settings: data,
        transitionsBuilder: fadeThrough,
        fullscreenDialog: true,
      );
    },
    UpdateProfilePage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const UpdateProfilePage(),
        settings: data,
        transitionsBuilder: fadeThrough,
      );
    },
    ContactsPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => ContactsPage(),
        settings: data,
        transitionsBuilder: fadeThrough,
      );
    },
    PushNotificationPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const PushNotificationPage(),
        settings: data,
        transitionsBuilder: fadeThrough,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// RegistrationPage arguments holder class
class RegistrationPageArguments {
  final Key key;
  RegistrationPageArguments({this.key});
}

/// ListOfServiceProviders arguments holder class
class ListOfServiceProvidersArguments {
  final Key key;
  final String title;
  ListOfServiceProvidersArguments({this.key, @required this.title});
}

/// BookingPage arguments holder class
class BookingPageArguments {
  final Key key;
  final ServiceProvider serviceProvider;
  BookingPageArguments({this.key, @required this.serviceProvider});
}

/// ServiceProviderDetailPage arguments holder class
class ServiceProviderDetailPageArguments {
  final Key key;
  final ServiceProvider serviceProvider;
  ServiceProviderDetailPageArguments(
      {this.key, @required this.serviceProvider});
}

/// ChatScreen arguments holder class
class ChatScreenArguments {
  final String chatroomID;
  final ChatUser otherUser;
  final bool unread;
  final ChatRoom chatroom;
  ChatScreenArguments(
      {this.chatroomID, this.otherUser, this.unread, this.chatroom});
}

/// WorkCompletedWidget arguments holder class
class WorkCompletedWidgetArguments {
  final Key key;
  final ChatRoom chatRoom;
  final bool isMe;
  final Message message;
  WorkCompletedWidgetArguments(
      {this.key, this.chatRoom, this.isMe, this.message});
}

/// SendRatingWidget arguments holder class
class SendRatingWidgetArguments {
  final Key key;
  final ChatRoom chatRoom;
  final bool isMe;
  final Message message;
  SendRatingWidgetArguments({this.key, this.chatRoom, this.isMe, this.message});
}

/// JobsPendingDetailsPage arguments holder class
class JobsPendingDetailsPageArguments {
  final Key key;
  final String title;
  final List<PendingJob> listPendingJobs;
  JobsPendingDetailsPageArguments(
      {this.key, @required this.title, @required this.listPendingJobs});
}

/// JobsInProgressDetailsPage arguments holder class
class JobsInProgressDetailsPageArguments {
  final Key key;
  final String title;
  final List<InProgressJob> inProgressJobs;
  JobsInProgressDetailsPageArguments(
      {this.key, @required this.title, @required this.inProgressJobs});
}

/// JobsCompletedDetailsPage arguments holder class
class JobsCompletedDetailsPageArguments {
  final Key key;
  final String title;
  final List<CompletedJob> completedJobs;
  JobsCompletedDetailsPageArguments(
      {this.key, @required this.title, @required this.completedJobs});
}
