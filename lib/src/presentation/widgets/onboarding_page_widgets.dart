import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/common/utils/icons.dart';
import 'package:bonyeza_kazi/src/application/service_providers_from_specific_category_cubit/sp_from_category_cubit.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta/meta.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class BonyezaButton extends StatelessWidget {
  const BonyezaButton({
    Key key,
    this.backGroundColor,
    this.textColor,
    this.text,
    this.onButtonPressed,
    this.height = 60.0,
    this.margin = 20,
    this.borderRadius = 10.0,
  }) : super(key: key);

  final Color backGroundColor;
  final Color textColor;
  final String text;
  final Function onButtonPressed;
  final double margin;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      padding: EdgeInsetsResponsive.symmetric(horizontal: margin),
      widthResponsive: false,
      width: MediaQuery.of(context).size.width,
      height: height,
      child: RaisedButtonResponsive(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        child: TextResponsive(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 21,
            fontWeight: FontWeight.w500,
          ),
        ),
        color: backGroundColor,
        onPressed: onButtonPressed,
      ),
    );
  }
}

class SearchButtons extends StatelessWidget {
  const SearchButtons({
    Key key,
    this.backGroundColor,
    this.textColor,
    this.text,
    this.onButtonPressed,
    this.height = 60.0,
    this.margin = 20,
    this.borderRadius = 15.0,
  }) : super(key: key);

  final Color backGroundColor;
  final Color textColor;
  final String text;
  final Function onButtonPressed;
  final double margin;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      padding: EdgeInsetsResponsive.symmetric(horizontal: margin),
      widthResponsive: false,
      width: MediaQuery.of(context).size.width,
      height: height,
      child: RaisedButtonResponsive(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        child: TextResponsive(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 21,
            fontWeight: FontWeight.w500,
          ),
        ),
        color: backGroundColor,
        onPressed: onButtonPressed,
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {Key key, @required this.categoryName, @required this.clickable})
      : super(key: key);

  final String categoryName;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    final spFromCategoryCubit = BlocProvider.of<SPFromCategoryCubit>(context);
    return Column(
      children: [
        Parent(
          gesture: Gestures()
            ..onTap(() {
              if (clickable) {
                spFromCategoryCubit.searchForServiceProvidersByCategory(
                    skills: this.categoryName);
                ExtendedNavigator.of(context).push(
                    Routes.listOfServiceProviders,
                    arguments: ListOfServiceProvidersArguments(
                        title: this.categoryName));
              }
            }),
          style: ParentStyle()
            ..ripple(true)
            ..alignmentContent.center(),
          child: getIcon(this.categoryName),
        ),
        SizedBox(
          height: 5.h,
        ),
        Txt(this.categoryName,
            style: TxtStyle()
              ..textColor(Colors.black87)
              ..fontWeight(FontWeight.w400)
              ..fontSize(14.sp)
              ..textAlign.center()
              ..maxLines(2)),
      ],
    );
  }
}

var list = [
  'Repairs',
  'Moving',
  'Fumigation',
  'Gardening',
  'Home Cleaning',
  'Laundry',
  'Furniture Making and Repair',
  'Cleaning Services',
  'Electrician',
  'Plumbing'
];

Widget getIcon(String categoryName) {
  if (categoryName == 'Repairs') {
    return Icon(
      UiIcons.woodwork,
      color: Color(0xFF8CC641),
      size: 90.h,
    );
  } else if (categoryName == 'Moving') {
    return Icon(
      UiIcons.healthcare,
      color: Color(0xFF41C4DC),
      size: 90.h,
    );
  } else if (categoryName == 'Fumigation') {
    return Icon(
      UiIcons.flame,
      color: Color(0xFFB9529F),
      size: 90.h,
    );
  } else if (categoryName == 'Gardening') {
    return Icon(
      UiIcons.event,
      color: Color(0xFF7258A5),
      size: 90.h,
    );
  } else if (categoryName == 'Home Cleaning') {
    return Icon(
      UiIcons.decor,
      color: Color(0xFF2D3691),
      size: 90.h,
    );
  } else if (categoryName == 'Laundry') {
    return Icon(
      UiIcons.decor,
      color: Color(0xFF2D3691),
      size: 90.h,
    );
  } else if (categoryName == 'Furniture Making and Repair') {
    return Icon(
      UiIcons.maintenance,
      color: Color(0xFF3CB64B),
      size: 90.h,
    );
  } else if (categoryName == 'Cleaning Services') {
    return Icon(
      UiIcons.decor,
      color: Color(0xFF2D3691),
      size: 90.h,
    );
  } else if (categoryName == 'Electrician') {
    return Icon(
      UiIcons.electrician,
      color: Color(0xFF17AA9D),
      size: 90.h,
    );
  } else if (categoryName == 'Plumbing') {
    return Icon(
      UiIcons.plumbing,
      color: Color(0xFFD51C5C),
      size: 90.h,
    );
  } else {
    return Icon(
      UiIcons.beauty,
      color: Color(0xFFF79421),
      size: 90.h,
    );
  }
}
