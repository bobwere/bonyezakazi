import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/login_cubit/login_cubit.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:smart_form/smart_form.dart';

class BonyezaField extends StatelessWidget {
  const BonyezaField(
      {Key key,
      @required this.hintText,
      @required this.onChanged,
      this.obscureText = false,
      @required this.validationErrorText})
      : super(key: key);

  final String hintText;
  final bool obscureText;
  final Function(String value) onChanged;
  final String validationErrorText;
  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      widthResponsive: false,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsetsResponsive.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.h),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor.shade400,
                blurRadius: kBoxShadowBlur,
                offset: kBoxShadowOffset)
          ]),
      child: SmartTextFormField(
          autovalidate: true,
          textAlign: TextAlign.center,
          obscureText: obscureText,
          style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 20.h, bottom: 20.h),
              isDense: true,
              hintText: hintText,
              errorStyle: TextStyle(height: 0),
              hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              border: InputBorder.none),
          validator: RequiredValidator(errorText: ''),
          onChanged: (value) => onChanged(value)),
    );
  }
}

class LoginUsernameField extends StatelessWidget {
  const LoginUsernameField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginCubit loginCubit = BlocProvider.of<LoginCubit>(context);

    return ContainerResponsive(
      height: 60,
      widthResponsive: false,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 25.h),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.h),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor.shade400,
                blurRadius: kBoxShadowBlur,
                offset: kBoxShadowOffset),
          ]),
      child: SmartTextFormField(
        autovalidate: true,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black54,
            fontSize: 21.h,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 25.h),
            helperText: ' ',
            prefixIcon:
                Icon(LineAwesomeIcons.user, color: Colors.grey.shade500),
            hintText: 'Enter your username',
            hintStyle: TextStyle(fontSize: 21.h, fontWeight: FontWeight.w400),
            border: InputBorder.none),
        validator: RequiredValidator(
            errorText: '                please enter your username'),
        onChanged: (value) {
          loginCubit.usernameChanged(value);
        },
      ),
    );
  }
}

class BonyezaDivider extends StatelessWidget {
  const BonyezaDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 2.h,
            width: 180.h,
            color: Colors.grey,
          ),
          Txt(
            'Or',
            style: kUnitingTalentTextStyle.clone()..textColor(Colors.grey),
          ),
          Container(
            height: 2.h,
            width: 180.h,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({Key key, this.onTextPressed}) : super(key: key);

  final Function onTextPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTextPressed,
      child: Container(
        padding: EdgeInsets.all(20.h),
        child: Center(
          child: RichText(
            text: TextSpan(
                text: 'Don\'t have an account?',
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Sign Up',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w800),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
