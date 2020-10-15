import 'package:auto_route/auto_route_annotations.dart';
import 'package:bonyeza_kazi/common/routes/page_transitions.dart';
import 'package:bonyeza_kazi/src/presentation/list_of_service_providers_page/list_of_service_providers.dart';
import 'package:bonyeza_kazi/src/presentation/login_page/login_page.dart';
import 'package:bonyeza_kazi/src/presentation/profile_page/contacts_page.dart';
import 'package:bonyeza_kazi/src/presentation/profile_page/jobs_detail_page.dart';
import 'package:bonyeza_kazi/src/presentation/profile_page/push_notification_page.dart';
import 'package:bonyeza_kazi/src/presentation/registration_page/registration_page.dart';
import 'package:bonyeza_kazi/src/presentation/service_provider_detail_page/service_provider_detail_page.dart';
import 'package:bonyeza_kazi/src/presentation/update_profile_page/update_profile_page.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/auth_widget.dart';
import 'package:bonyeza_kazi/src/presentation/messages_page/chat_screen_page.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/send_rating_widget.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/booking_page.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/work_completed_widget.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: AuthWidget, initial: true),
    CustomRoute(
        path: '/login', page: LoginPage, transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/register',
        page: RegistrationPage,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/listofserviceproviders',
        page: ListOfServiceProviders,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/bookingpage',
        fullscreenDialog: true,
        page: BookingPage,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/serviceproviderdetailpage',
        page: ServiceProviderDetailPage,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/chatscreen', page: ChatScreen, transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/workcompletedwidget',
        fullscreenDialog: true,
        page: WorkCompletedWidget,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/sendratingwidget',
        fullscreenDialog: true,
        page: SendRatingWidget,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/jobspendingdetailspage',
        fullscreenDialog: true,
        page: JobsPendingDetailsPage,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/jobsinprogressdetailspage',
        fullscreenDialog: true,
        page: JobsInProgressDetailsPage,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/jobscompleteddetailspage',
        fullscreenDialog: true,
        page: JobsCompletedDetailsPage,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/updateprofilepage',
        page: UpdateProfilePage,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/contactspage',
        page: ContactsPage,
        transitionsBuilder: fadeThrough),
    CustomRoute(
        path: '/pushnotificationpage',
        page: PushNotificationPage,
        transitionsBuilder: fadeThrough),
  ],
)
class $Router {}
