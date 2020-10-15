import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/application/chat/chats_list_cubit/chats_list_cubit.dart';
import 'package:bonyeza_kazi/src/application/favourites_cubit/favourites_cubit.dart';
import 'package:bonyeza_kazi/src/application/login_cubit/login_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/login_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/registration_page_widgets.dart';
import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:smart_form/smart_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    final ChatsListCubit chatsListCubit =
        BlocProvider.of<ChatsListCubit>(context);
    final FavouritesCubit favouritesCubit =
        BlocProvider.of<FavouritesCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
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
                  userNotFound: (_) {
                    Flushbar(
                      title: 'An Error Occurred',
                      message: USER_NOT_FOUND,
                      margin: EdgeInsets.all(20.h),
                      flushbarPosition: FlushbarPosition.TOP,
                      duration: Duration(seconds: 3),
                      isDismissible: true,
                      backgroundColor: Color(0xFFFD9726),
                      borderRadius: 15.h,
                    ).show(context);
                  },
                  formValidation: (_) {});
            },
            (_) {
              Flushbar(
                title: 'Login Successful',
                message: 'Welcome Back',
                margin: EdgeInsets.all(20.h),
                flushbarPosition: FlushbarPosition.TOP,
                duration: Duration(seconds: 3),
                isDismissible: true,
                backgroundColor: Colors.green,
                borderRadius: 15.h,
              ).show(context);
              authCubit.logIn();
              chatsListCubit.getChatsList();
              favouritesCubit.getMyFavourites();
            },
          ),
        );
        if (state.isSubmitting) {
          Flushbar(
            title: 'Attempting to login',
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
            LoginBody(state: state),
            SubmittingOverlay(isSubmitting: state.isSubmitting)
          ],
        );
      },
    );
  }
}

class LoginBody extends StatefulWidget {
  LoginBody({Key key, @required this.state}) : super(key: key);
  final LoginState state;

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<SmartFormState>();
  @override
  Widget build(BuildContext context) {
    final LoginCubit loginCubit = BlocProvider.of<LoginCubit>(context);
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SmartForm(
          key: _formKey,
          autovalidate: widget.state.showErrorMessages,
          child: Column(
            children: [
              SizedBoxResponsive(height: 70),

              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Image.asset(
                    'assets/images/NYAKUA.png',
                    width: 500.w,
                    height: 120.h,
                  ),
                ),
              ),

              SizedBoxResponsive(height: 30),
              //Username Input
              BonyezaField(
                hintText: 'Username',
                validationErrorText: 'Please enter username',
                onChanged: (value) {
                  loginCubit.usernameChanged(value);
                },
              ),

              SizedBoxResponsive(height: 30),
              //Password Input
              BonyezaField(
                hintText: 'Password',
                validationErrorText: 'Please enter password',
                obscureText: true,
                onChanged: (value) {
                  loginCubit.passwordChanged(value);
                },
              ),

              SizedBoxResponsive(height: 30),
              //Login Button
              BonyezaButton(
                backGroundColor: kGreenBackgroundColor,
                borderRadius: 100,
                textColor: Colors.white,
                text: 'Sign In',
                onButtonPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (_formKey.currentState.validate()) {
                    loginCubit.signInWithUsernameAndPassword();
                  } else {
                    Flushbar(
                      title: 'Unable to login',
                      message: 'Provide the missing details to proceed',
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

              SizedBoxResponsive(height: 50),
              BonyezaDivider(),
              BlocBuilder<LoginCubit, LoginState>(
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
                    return Container(
                      height: 50.h,
                    );
                  }
                },
              ),
              BonyezaButton(
                backGroundColor: kRedBackgroundColor,
                borderRadius: 100,
                textColor: Colors.white,
                text: 'Sign In with gmail',
                onButtonPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (_formKey.currentState.validate()) {
                    // loginCubit.signInWithUsernameAndPassword();
                  }
                },
              ),

              SizedBoxResponsive(height: 30),
              BonyezaButton(
                backGroundColor: kDarkBlueBackgroundColor,
                borderRadius: 100,
                textColor: Colors.white,
                text: 'Sign In with Facebook',
                onButtonPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (_formKey.currentState.validate()) {
                    // loginCubit.signInWithUsernameAndPassword();
                  }
                },
              ),
              SizedBoxResponsive(height: 30),
              DontHaveAnAccount(
                onTextPressed: () {
                  authCubit.registerClient();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
