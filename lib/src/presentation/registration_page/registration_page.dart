import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/application/chat/chats_list_cubit/chats_list_cubit.dart';
import 'package:bonyeza_kazi/src/application/favourites_cubit/favourites_cubit.dart';
import 'package:bonyeza_kazi/src/application/registration_cubit/registration_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/registration_page/client_registration_body.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/registration_page_widgets.dart';
import 'package:bonyeza_kazi/src/services/push_notification_service.dart';
import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import 'service_provider_body.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    final ChatsListCubit chatsListCubit =
        BlocProvider.of<ChatsListCubit>(context);
    final FavouritesCubit favouritesCubit =
        BlocProvider.of<FavouritesCubit>(context);
    final PushNotificationService pushNotificationService =
        Provider.of<PushNotificationService>(context);
    return BlocConsumer<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
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
                      formValidation: (error) {
                        Flushbar(
                          title: 'An Error Occurred',
                          message: error.error,
                          margin: EdgeInsets.all(20.h),
                          flushbarPosition: FlushbarPosition.TOP,
                          duration: Duration(seconds: 3),
                          isDismissible: true,
                          backgroundColor: Color(0xFFFD9726),
                          borderRadius: 15.h,
                        ).show(context);
                      },
                      userNotFound: (_) {});
                }, (_) {
                  Flushbar(
                    title: 'Registration Successful',
                    message: 'Welcome to Bonyeza Kazi',
                    margin: EdgeInsets.all(20.h),
                    flushbarPosition: FlushbarPosition.TOP,
                    duration: Duration(seconds: 3),
                    isDismissible: true,
                    backgroundColor: Colors.green,
                    borderRadius: 15.h,
                  ).show(context);
                  authCubit.logIn();
                  pushNotificationService.initialise();
                  chatsListCubit.getChatsList();
                  favouritesCubit.getMyFavourites();
                }));
        if (state.isSubmitting) {
          Flushbar(
            title: 'Attempting to register you',
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
            RegistrationTabBar(
              state: state,
            ),
            SubmittingOverlay(isSubmitting: state.isSubmitting)
          ],
        );
      },
    );
  }
}

class RegistrationTabBar extends StatefulWidget {
  const RegistrationTabBar({this.state});
  final RegistrationState state;
  @override
  State<StatefulWidget> createState() => _RegistrationTabBarState();
}

class _RegistrationTabBarState extends State<RegistrationTabBar> {
  Widget _buildAppbar() {
    return AppBar(
      title: Txt("Register As",
          style: kAppBarTxtStyle.clone()..textColor(Colors.black87)),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.h,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: TabBar(
                indicator: DotIndicator(
                  color: kBlueBackgroundColor,
                  distanceFromCenter: 16,
                  radius: 3,
                  paintingStyle: PaintingStyle.fill,
                ),
                indicatorColor: kBlueBackgroundColor,
                labelColor: kBlueBackgroundColor,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
                unselectedLabelColor: CupertinoColors.systemGrey,
                tabs: <Widget>[
                  Tab(
                    text: "Client",
                  ),
                  Tab(
                    text: "Service Provider",
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      children: [
                        ClientRegistrationBody(state: widget.state),
                        SPRegistrationBody(state: widget.state),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
