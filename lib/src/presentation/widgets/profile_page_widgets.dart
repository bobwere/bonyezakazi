import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:division/division.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class Constants {
  static const String InviteFriends = 'Invite Friends';

  static const String PushNotifications = 'Push Notifications';

  static const String UpdateProfile = 'Update Profile';

  static const String SignOut = 'Sign out';

  static const List<String> choices = <String>[
    InviteFriends,
    PushNotifications,
    UpdateProfile,
    SignOut
  ];
}

class BonyezaProfilePageButtons extends StatelessWidget {
  const BonyezaProfilePageButtons({
    Key key,
    this.backGroundColor,
    this.textColor,
    this.text,
    this.figure = '',
    this.onButtonPressed,
    this.margin = 20.0,
    this.padding = 10.0,
    this.borderRadius = 100.0,
  }) : super(key: key);

  final Color backGroundColor;
  final Color textColor;
  final String text;
  final String figure;
  final Function onButtonPressed;
  final double margin;
  final double padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Parent(
          style: ParentStyle()
            ..height(70.h)
            ..margin(horizontal: this.margin.h)
            ..background.color(this.backGroundColor)
            ..borderRadius(all: this.borderRadius)
            ..ripple(true)
            ..boxShadow(
                color: kBoxShadowColor.shade500,
                offset: kBoxShadowOffset,
                blur: kBoxShadowBlur)
            ..alignmentContent.center(),
          gesture: Gestures()..onTap(this.onButtonPressed),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: this.padding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Txt(
                  this.text,
                  style: TxtStyle()
                    ..fontFamily('Avenir')
                    ..fontWeight(FontWeight.w500)
                    ..fontSize(20.sp)
                    ..textColor(this.textColor),
                ),
                Txt(
                  this.figure,
                  style: TxtStyle()
                    ..fontFamily('Avenir')
                    ..fontWeight(FontWeight.w500)
                    ..fontSize(this.figure.isEmpty ? 0.sp : 20.sp)
                    ..textColor(this.textColor),
                ),
              ],
            ),
          )),
    );
  }
}

class GridOfFilterButtons extends StatelessWidget {
  const GridOfFilterButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: BonyezaProfilePageButtons(
                backGroundColor: Colors.white,
                text: 'Profile Views',
                figure: '78',
                textColor: Colors.black87,
                onButtonPressed: () {},
                borderRadius: 15.h,
                padding: 0,
                margin: 0,
              ),
            ),
            SizedBox(
              width: 8.h,
            ),
            Expanded(
              flex: 1,
              child: BonyezaProfilePageButtons(
                backGroundColor: Colors.white,
                text: 'Interested',
                figure: '21',
                textColor: Colors.black87,
                onButtonPressed: () {},
                borderRadius: 15.h,
                padding: 0,
                margin: 0,
              ),
            ),
            SizedBox(
              width: 8.h,
            ),
            Expanded(
              flex: 1,
              child: BonyezaProfilePageButtons(
                backGroundColor: Colors.white,
                text: 'New Jobs',
                figure: '13',
                textColor: Colors.black87,
                onButtonPressed: () {},
                borderRadius: 15.h,
                padding: 0,
                margin: 0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: BonyezaProfilePageButtons(
                backGroundColor: Colors.white,
                text: 'Completed',
                figure: '18',
                textColor: Colors.black87,
                onButtonPressed: () {},
                borderRadius: 15.h,
                padding: 0,
                margin: 0,
              ),
            ),
            SizedBox(
              width: 8.h,
            ),
            Expanded(
              flex: 1,
              child: BonyezaProfilePageButtons(
                backGroundColor: Colors.white,
                text: 'Pending',
                figure: '6',
                textColor: Colors.black87,
                onButtonPressed: () {},
                borderRadius: 15.h,
                padding: 0,
                margin: 0,
              ),
            ),
            SizedBox(
              width: 8.h,
            ),
            Expanded(
              flex: 1,
              child: BonyezaProfilePageButtons(
                backGroundColor: Colors.white,
                text: 'Rejected',
                figure: '8',
                textColor: Colors.black87,
                onButtonPressed: () {},
                borderRadius: 15.h,
                padding: 0,
                margin: 0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: BonyezaProfilePageButtons(
                backGroundColor: Colors.white,
                text: 'Paid Jobs',
                figure: '16',
                textColor: Colors.black87,
                onButtonPressed: () {},
                borderRadius: 15.h,
                padding: 0,
                margin: 0,
              ),
            ),
            SizedBox(
              width: 8.h,
            ),
            Expanded(
              flex: 1,
              child: BonyezaProfilePageButtons(
                backGroundColor: Colors.white,
                text: 'Unpaid Jobs',
                figure: '3',
                textColor: Colors.black87,
                onButtonPressed: () {},
                borderRadius: 15.h,
                padding: 0,
                margin: 0,
              ),
            ),
            SizedBox(
              width: 8.h,
            ),
            Expanded(
              flex: 1,
              child: BonyezaProfilePageButtons(
                backGroundColor: kBlueBackgroundColor,
                text: 'Update Profile',
                textColor: Colors.white,
                onButtonPressed: () {},
                borderRadius: 15.h,
                padding: 0,
                margin: 0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
