import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/application/registration_cubit/registration_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/registration_page_widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:smart_form/smart_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SPRegistrationBody extends StatefulWidget {
  const SPRegistrationBody({Key key, @required this.state}) : super(key: key);
  final RegistrationState state;

  @override
  _SPRegistrationBodyState createState() => _SPRegistrationBodyState();
}

class _SPRegistrationBodyState extends State<SPRegistrationBody>
    with AutomaticKeepAliveClientMixin<SPRegistrationBody> {
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
            child: Column(children: [
              SizedBox(
                height: 10.h,
              ),
              UsernameField(),
              SizedBox(height: 20.h),
              SkillsRegDropDown(items: [...skills]),
              SizedBox(height: 20.h),
              Row(
                children: [
                  CountryCodeField(),
                  Expanded(child: PhoneNumberField()),
                ],
              ),
              SizedBox(height: 20.h),
              PasswordField(),
              SizedBox(height: 20.h),
              CityField(),
              SizedBox(height: 20.h),
              LocationRegDropDown(items: [...locations]),
              SizedBox(height: 20.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: ProfileImagePicker(),
                  )),
              SizedBox(
                height: 20.h,
              ),
              MultipleImagePicker(),
              SizedBox(
                height: 20.h,
              ),
              BonyezaButton(
                backGroundColor: kGreenBackgroundColor,
                textColor: Colors.white,
                text: 'REGISTER',
                onButtonPressed: () {
                  if (_formKey.currentState.validate()) {
                    registrationCubit
                        .registerAsServiceProviderWithUsernameAndPassword();
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
              SizedBox(
                height: 10.h,
              ),
              AlreadyHaveAnAccount(
                onTextPressed: () {
                  authCubit.logIn();
                },
              ),
            ]),
          ),
        ),
        Positioned(
          bottom: 260.h,
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
