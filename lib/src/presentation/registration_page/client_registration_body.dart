import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/application/registration_cubit/registration_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/registration_page_widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:smart_form/smart_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientRegistrationBody extends StatefulWidget {
  const ClientRegistrationBody({Key key, @required this.state})
      : super(key: key);
  final RegistrationState state;

  @override
  _ClientRegistrationBodyState createState() => _ClientRegistrationBodyState();
}

class _ClientRegistrationBodyState extends State<ClientRegistrationBody>
    with AutomaticKeepAliveClientMixin<ClientRegistrationBody> {
  final _formKey = GlobalKey<SmartFormState>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final RegistrationCubit registrationCubit =
        BlocProvider.of<RegistrationCubit>(context);
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return Stack(
      children: [
        SmartForm(
          key: _formKey,
          autovalidate: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBoxResponsive(
                  height: 120,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Image.asset(
                      'assets/images/NYAKUA.png',
                      width: 500.w,
                      height: 190.h,
                    ),
                  ),
                ),
                SizedBoxResponsive(
                  height: 50,
                ),
                BonyezaRegistrationField(
                  hintText: 'Your Name',
                  validationErrorText: 'Please enter username',
                  onChanged: (value) {
                    registrationCubit.usernameChanged(value);
                  },
                ),
                SizedBoxResponsive(
                  height: 30,
                ),
                Row(
                  children: [
                    CountryCodeField(),
                    Expanded(
                      child: BonyezaRegistrationField(
                        hintText: '7** *** ***',
                        validationErrorText: 'Please enter phone',
                        onChanged: (value) {
                          registrationCubit.phoneChanged(value);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBoxResponsive(
                  height: 30,
                ),
                BonyezaRegistrationField(
                  hintText: 'Password',
                  validationErrorText: 'Please enter password',
                  obscureText: true,
                  onChanged: (value) {
                    registrationCubit.passwordChanged(value);
                  },
                ),
                SizedBoxResponsive(
                  height: 100,
                ),
                BonyezaButton(
                  backGroundColor: kGreenBackgroundColor,
                  textColor: Colors.white,
                  borderRadius: 100,
                  text: 'Register',
                  onButtonPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (_formKey.currentState.validate()) {
                      registrationCubit
                          .registerAsClientWithUsernameAndPassword();
                    } else {
                      Flushbar(
                        title: 'Unable to register you',
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
                SizedBoxResponsive(
                  height: 20,
                ),
                AlreadyHaveAnAccount(
                  onTextPressed: () {
                    authCubit.logIn();
                  },
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 215.h,
          left: 220.w,
          child: BlocBuilder<RegistrationCubit, RegistrationState>(
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
      ],
    );
  }
}
