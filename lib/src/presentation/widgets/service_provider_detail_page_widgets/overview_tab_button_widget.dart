import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverviewTabButton extends StatelessWidget {
  const OverviewTabButton(
      {Key key,
      @required this.text,
      @required this.icon,
      @required this.onButtonPressed})
      : super(key: key);

  final String text;
  final IconData icon;
  final Function onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Parent(
            style: kOverviewTabButtonStyle,
            gesture: Gestures()..onTap(this.onButtonPressed),
            child: Icon(
              this.icon,
              color: kBlueBackgroundColor,
              size: 40.h,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Txt(
            this.text,
            style: kOverviewTabTextStyle,
          )
        ],
      ),
    );
  }
}
