import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kBlueBackgroundColor = Color(0xFF0095D8);
const kDarkBlueBackgroundColor = Color(0xFF407BD9);
const kGreenBackgroundColor = Color(0xFF07D054);
const kRedBackgroundColor = Color(0xFFF24343);

const kYellowStarColor = Color(0xFFE7711B);
const kBoxShadowColor = Colors.grey;
const kBoxShadowBlur = 3.0;
const kBoxShadowOffset = Offset(1, 1);

final List<Color> kPlaceHolderColors = [
  Color(0xFFBFC4C9),
  Color(0xFF809AB3),
  Color(0xFF6685A2),
  Color(0xFF809AB3),
  Color(0xFF4D7195),
  Color(0xFF325C84),
  Color(0xFF405A73),
  Color(0xFF33526F),
  Color(0xFF1B426B),
  Color(0xFF002951),
  Color(0xFF002448),
  Color(0xFF001F3C),
  Color(0xFF001A33),
];

final List<Color> kAllCategoriesColors = [
  Color(0xFFFD87B2),
  Color(0xFFAB98FF),
  Color(0xFF7DA0FA),
  Color(0xFFFD8787),
  Color(0xFFFFC188),
];

final kUnitingTalentBackground = ParentStyle()
  ..height(60.h)
  ..background.color(kBlueBackgroundColor);

final kUnitingTalentTextStyle = TxtStyle()
  ..fontWeight(FontWeight.bold)
  ..fontSize(22.sp)
  ..textColor(Colors.white);

final kAppBarTxtStyle = TxtStyle()
  ..fontSize(30.sp)
  ..fontWeight(FontWeight.w500)
  ..textColor(Colors.white);

final kAppBarTextStyle =
    TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black87);

final kOverviewTabButtonStyle = ParentStyle()
  ..height(65.h)
  ..width(65.h)
  ..borderRadius(all: 50.h)
  ..ripple(true,
      splashColor: kBlueBackgroundColor, highlightColor: kBlueBackgroundColor)
  ..background.color(Colors.white)
  ..boxShadow(
      color: kBoxShadowColor.shade400,
      blur: kBoxShadowBlur,
      offset: kBoxShadowOffset);

final kOverviewTabTextStyle = TxtStyle()
  ..fontFamily('Avenir')
  ..fontWeight(FontWeight.w800)
  ..fontSize(20.sp)
  ..textColor(Colors.black87);

final kSearchBarTextStyle = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 20.sp,
    color: Colors.black87,
    fontWeight: FontWeight.w500);

final kSearchBarHintStyle = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 20.sp,
    color: Colors.black87,
    fontWeight: FontWeight.w500);

final timeTextStyle = TextStyle(
  color: Colors.grey.shade500,
  fontSize: 21.sp,
  fontWeight: FontWeight.w500,
);

final notMetimeTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 21.sp,
  fontWeight: FontWeight.w500,
);

final kMessageHeadingTextStyle = TextStyle(
  color: Colors.black87,
  fontSize: 21.sp,
  fontWeight: FontWeight.w500,
);

final kMessageBodyTextStyle = TextStyle(
  color: Colors.black87,
  fontSize: 21.sp,
  fontWeight: FontWeight.w400,
);

final kNotMeMessageBodyTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 21.sp,
  fontWeight: FontWeight.w400,
);

final kNotMeMessageHeadingTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 21.sp,
  fontWeight: FontWeight.w500,
);

final kMessageBookingDateTimeStyle = TextStyle(
  color: Colors.black54,
  fontSize: 20.sp,
  fontWeight: FontWeight.w400,
);

final kMessageAcceptDenyTextSytle = TextStyle(
  color: Colors.white,
  fontSize: 21.sp,
  fontWeight: FontWeight.w500,
);

final kServerOrNotMeMessageBoxDecoration = BoxDecoration(
  color: Colors.orange.withOpacity(0.4),
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(15.h),
    bottomRight: Radius.circular(15.h),
  ),
);

final isMeBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(15.h),
  bottomLeft: Radius.circular(15.h),
);

final isNotMeBorderRadius = BorderRadius.only(
  topRight: Radius.circular(15.h),
  bottomRight: Radius.circular(15.h),
);
