import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/search_cubit/search_cubit.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final CameraPosition nrbCBD = CameraPosition(
  target: LatLng(-1.286389, 36.817223),
  zoom: 12,
);

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50.h,
        width: 50.h,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({Key key, @required this.message}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.h,
      height: 150.h,
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      margin: EdgeInsets.symmetric(vertical: 50.h),
      decoration: BoxDecoration(
          color: Color(0xFFFD9726),
          borderRadius: BorderRadius.all(Radius.circular(15.h)),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor,
                offset: kBoxShadowOffset,
                blurRadius: kBoxShadowBlur)
          ]),
      child: Center(
        child: Text(
          message + "\nTap to retry",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class LocationDropDown extends StatefulWidget {
  LocationDropDown({Key key, @required this.items}) : super(key: key);
  List<String> items;

  @override
  _LocationDropDownState createState() => _LocationDropDownState();
}

class _LocationDropDownState extends State<LocationDropDown> {
  String location;
  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
    return Parent(
      style: ParentStyle()
        ..borderRadius(all: 15.h)
        ..border(
            all: 1.0, color: Colors.grey.shade500, style: BorderStyle.solid)
        ..background.color(Colors.white)
        ..height(60.h)
        ..padding(left: 10.h)
        ..ripple(true),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: location,
            isExpanded: true,
            hint: Text("Location",
                style: TextStyle(
                    fontSize: 21.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400)),
            items: [...widget.items]
                .map((location) => DropdownMenuItem(
                      value: location,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('$location',
                            style: TextStyle(
                                fontSize: 21.sp,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400)),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                location = value;
              });
              searchCubit.locationChanged(value);
            }),
      ),
    );
  }
}

class RatingDropDown extends StatefulWidget {
  RatingDropDown({Key key, @required this.items}) : super(key: key);
  List<String> items;

  @override
  _RatingDropDownState createState() => _RatingDropDownState();
}

class _RatingDropDownState extends State<RatingDropDown> {
  String rating;
  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
    return Parent(
      style: ParentStyle()
        ..borderRadius(all: 15.h)
        ..border(
            all: 1.0, color: Colors.grey.shade500, style: BorderStyle.solid)
        ..background.color(Colors.white)
        ..height(60.h)
        ..padding(left: 10.h)
        ..ripple(true),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: rating,
            isExpanded: true,
            hint: Text("Rated",
                style: TextStyle(
                    fontSize: 21.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400)),
            items: [...widget.items]
                .map((rating) => DropdownMenuItem(
                      value: rating,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('$rating',
                            style: TextStyle(
                                fontSize: 21.sp,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400)),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                rating = value;
              });
              searchCubit.ratingChanged(value);
            }),
      ),
    );
  }
}

class SkillsDropDown extends StatefulWidget {
  SkillsDropDown({Key key, @required this.items}) : super(key: key);
  List<String> items;

  @override
  _SkillsDropDownState createState() => _SkillsDropDownState();
}

class _SkillsDropDownState extends State<SkillsDropDown> {
  String skills;
  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
    return Parent(
      style: ParentStyle()
        ..borderRadius(all: 15.h)
        ..border(
            all: 1.0, color: Colors.grey.shade500, style: BorderStyle.solid)
        ..background.color(Colors.white)
        ..height(60.h)
        ..padding(left: 10.h)
        ..ripple(true),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: skills,
            isExpanded: true,
            hint: Text("Skill",
                style: TextStyle(
                    fontSize: 21.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400)),
            items: [...widget.items]
                .map((skills) => DropdownMenuItem(
                      value: skills,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('$skills',
                            style: TextStyle(
                                fontSize: 21.sp,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400)),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                skills = value;
              });
              searchCubit.skillChanged(value);
            }),
      ),
    );
  }
}
