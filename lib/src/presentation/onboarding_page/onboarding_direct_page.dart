import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class OnboardingDirectPage extends StatelessWidget {
  const OnboardingDirectPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
        backgroundColor: kBlueBackgroundColor,
        body: Column(
          children: [
            SizedBoxResponsive(
              height: 100,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Image.asset(
                  'assets/images/NYAKUA.png',
                  width: 500.w,
                  height: 200.h,
                ),
              ),
            ),
            SizedBoxResponsive(
              height: 150,
            ),
            BonyezaButton(
              backGroundColor: kGreenBackgroundColor,
              borderRadius: 100,
              textColor: Colors.white,
              text: 'LOOKING FOR A SERVICE',
              onButtonPressed: () {
                authCubit.registerClient();
              },
            ),
            SizedBoxResponsive(
              height: 30,
            ),
            BonyezaButton(
              backGroundColor: Colors.white,
              borderRadius: 100,
              textColor: Color(0xFF606161),
              text: 'PROVIDING A SERVICE',
              onButtonPressed: () {},
            ),
          ],
        ));
  }
}
