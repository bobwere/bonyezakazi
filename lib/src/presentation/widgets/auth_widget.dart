import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/application/jobs_details/jobs_completed_cubit/jobs_completed_cubit.dart';
import 'package:bonyeza_kazi/src/application/jobs_details/jobs_in_progress_cubit/jobs_in_progress_cubit.dart';
import 'package:bonyeza_kazi/src/application/jobs_details/jobs_pending_cubit/jobs_pending_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/login_page/login_page.dart';
import 'package:bonyeza_kazi/src/presentation/onboarding_page/onboarding_direct_page.dart';
import 'package:bonyeza_kazi/src/presentation/onboarding_page/onboarding_page.dart';
import 'package:bonyeza_kazi/src/presentation/registration_page/new_client_registration.dart';
import 'package:bonyeza_kazi/src/presentation/registration_page/new_sp_registration.dart';
import 'package:bonyeza_kazi/src/presentation/splash_page/splash_page.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/home_widget.dart';
import 'package:bonyeza_kazi/src/services/push_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PushNotificationService pushNotificationService =
        Provider.of<PushNotificationService>(context);
    JobsPendingCubit jobsPendingCubit =
        BlocProvider.of<JobsPendingCubit>(context);
    JobsInProgressCubit jobsInProgressCubit =
        BlocProvider.of<JobsInProgressCubit>(context);
    JobsCompletedCubit jobsCompletedCubit =
        BlocProvider.of<JobsCompletedCubit>(context);

    ResponsiveWidgets.init(
      context,
      height: 854,
      width: 480,
      allowFontScaling: false,
    );

    return ResponsiveWidgets.builder(
        height: 854,
        width: 480,
        allowFontScaling: false,
        child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
          return state.map(uninitialized: (_) {
            return SplashPage();
          }, authenticated: (_) {
            pushNotificationService.onTokenRefresh();
            jobsPendingCubit.getPendingJobs();
            jobsInProgressCubit.getJobsInProgress();
            jobsCompletedCubit.getJobsCompleted();
            return HomeWidget();
          }, unauthenticated: (_) {
            return LoginPage();
          }, onboarding: (_) {
            return OnboardingPage();
          }, searchingFor: (_) {
            return OnboardingDirectPage();
          }, unregisteredClient: (_) {
            return NewClientRegistrationPage();
          }, unregisteredSp: (_) {
            return NewSPRegistrationPage();
          });
        }));
  }
}
