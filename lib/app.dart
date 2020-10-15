import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/theme.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart' as router;
import 'package:bonyeza_kazi/injection_container.dart';
import 'package:bonyeza_kazi/src/application/job_journey/client_rates_job_done_cubit/client_rates_job_done_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/job_journey_cubit/job_journey_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/work_completed_cubit/work_completed_cubit.dart';
import 'package:bonyeza_kazi/src/application/jobs_details/jobs_completed_cubit/jobs_completed_cubit.dart';
import 'package:bonyeza_kazi/src/application/jobs_details/jobs_in_progress_cubit/jobs_in_progress_cubit.dart';
import 'package:bonyeza_kazi/src/application/jobs_details/jobs_pending_cubit/jobs_pending_cubit.dart';
import 'package:bonyeza_kazi/src/application/notifications/notifications_cubit/notification_cubit.dart';
import 'package:bonyeza_kazi/src/application/notifications/toggle_notifications_cubit/toggle_notifications_cubit.dart';
import 'package:bonyeza_kazi/src/application/update_user_profile_cubit/update_user_profile_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/home_page/home_page.dart';
import 'package:bonyeza_kazi/src/presentation/onboarding_page/onboarding_direct_page.dart';
import 'package:bonyeza_kazi/src/presentation/onboarding_page/onboarding_page.dart';
import 'package:bonyeza_kazi/src/presentation/registration_page/new_client_registration.dart';
import 'package:bonyeza_kazi/src/services/push_notification_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/application/categories_cubit/categories_cubit.dart';
import 'package:bonyeza_kazi/src/application/chat/chats_list_cubit/chats_list_cubit.dart';
import 'package:bonyeza_kazi/src/application/chat/create_message_cubit/create_message_cubit.dart';
import 'package:bonyeza_kazi/src/application/chat/instant_messaging_cubit/instant_messaging_cubit.dart';
import 'package:bonyeza_kazi/src/application/job_journey/client_job_description_cubit/job_description_cubit.dart';
import 'package:bonyeza_kazi/src/application/favourites_cubit/favourites_creation_cubit.dart';
import 'package:bonyeza_kazi/src/application/favourites_cubit/favourites_cubit.dart';
import 'package:bonyeza_kazi/src/application/login_cubit/login_cubit.dart';
import 'package:bonyeza_kazi/src/application/chat/chatroom_update_cubit/chatroom_update_cubit.dart';
import 'package:bonyeza_kazi/src/application/registration_cubit/registration_cubit.dart';
import 'package:bonyeza_kazi/src/application/reviews_cubit/reviews_cubit.dart';
import 'package:bonyeza_kazi/src/application/search_cubit/search_cubit.dart';
import 'package:bonyeza_kazi/src/application/service_provider_details_cubit/sp_details_cubit.dart';
import 'package:bonyeza_kazi/src/application/service_providers_from_specific_category_cubit/sp_from_category_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(create: (_) => sl<AuthCubit>()..appStarted()),
          BlocProvider<CategoriesCubit>(
              create: (_) => sl<CategoriesCubit>()..getAllCategories()),
          BlocProvider<FavouritesCubit>(create: (_) => sl<FavouritesCubit>()),
          BlocProvider<ChatsListCubit>(create: (_) => sl<ChatsListCubit>()),
          BlocProvider<LoginCubit>(create: (_) => sl<LoginCubit>()),
          BlocProvider<JobJourneyCubit>(create: (_) => sl<JobJourneyCubit>()),
          BlocProvider<RegistrationCubit>(
              create: (_) => sl<RegistrationCubit>()),
          BlocProvider<SearchCubit>(create: (_) => sl<SearchCubit>()),
          BlocProvider<SPFromCategoryCubit>(
              create: (_) => sl<SPFromCategoryCubit>()),
          BlocProvider<SPDetailsCubit>(create: (_) => sl<SPDetailsCubit>()),
          BlocProvider<ReviewsCubit>(create: (_) => sl<ReviewsCubit>()),
          BlocProvider<FavouritesCreationCubit>(
              create: (_) => sl<FavouritesCreationCubit>()),
          BlocProvider<JobDescriptionCubit>(
              create: (_) => sl<JobDescriptionCubit>()),
          BlocProvider<InstantMessagingCubit>(
              create: (_) => sl<InstantMessagingCubit>()),
          BlocProvider<CreateMessageCubit>(
              create: (_) => sl<CreateMessageCubit>()),
          BlocProvider<ChatroomUpdateCubit>(
              create: (_) => sl<ChatroomUpdateCubit>()),
          BlocProvider<WorkCompletedCubit>(
              create: (_) => sl<WorkCompletedCubit>()),
          BlocProvider<ClientRatesJobDoneCubit>(
              create: (_) => sl<ClientRatesJobDoneCubit>()),
          BlocProvider<JobsCompletedCubit>(
              create: (_) => sl<JobsCompletedCubit>()),
          BlocProvider<JobsInProgressCubit>(
              create: (_) => sl<JobsInProgressCubit>()),
          BlocProvider<JobsPendingCubit>(create: (_) => sl<JobsPendingCubit>()),
          BlocProvider<UpdateUserProfileCubit>(
              create: (_) => sl<UpdateUserProfileCubit>()),
          BlocProvider<NotificationsCubit>(
              create: (_) =>
                  sl<NotificationsCubit>()..getNotificationsStatus()),
          BlocProvider<ToggleNotificationStatusCubit>(
              create: (_) => sl<ToggleNotificationStatusCubit>()),
        ],
        child: Provider<PushNotificationService>(
          create: (_) => sl<PushNotificationService>(),
          child: MaterialApp(
            title: nameOfApp,
            theme: bonyezaTheme,
            debugShowCheckedModeBanner: false,
            //   locale: DevicePreview.of(context).locale,

            builder: ExtendedNavigator.builder(
              router: router.Router(),
              //builder: DevicePreview.appBuilder
              builder: (context, extendedNav) => Theme(
                data: bonyezaTheme,
                child: extendedNav,
              ),
            ),
            // home: HomePage(),
          ),
        ),
      ),
    );
  }
}
