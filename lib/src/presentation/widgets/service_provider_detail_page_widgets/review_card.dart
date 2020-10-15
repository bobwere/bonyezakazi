import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard(
      {Key key,
      @required this.name,
      @required this.rating,
      @required this.time,
      @required this.review})
      : super(key: key);
  final String name;
  final String rating;
  final String time;
  final String review;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueAccent,
              ),
              SizedBox(
                width: 20.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //  kOverviewTabTextStyle.clone()..fontSize(22.sp)
                  Txt(this.name,
                      style: kOverviewTabTextStyle.clone()..fontSize(22.sp)),
                ],
              )
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              SmoothStarRating(
                starCount: 5,
                isReadOnly: true,
                size: 26.sp,
                rating: double.tryParse(this.rating),
                color: kYellowStarColor,
                borderColor: kYellowStarColor,
              ),
              SizedBox(
                width: 10.h,
              ),
              Txt(this.time,
                  style: TxtStyle()
                    ..fontFamily('Avenia')
                    ..fontSize(22.sp)
                    ..fontWeight(FontWeight.w400)
                    ..textColor(Colors.grey)),
            ],
          ),
          SizedBox(height: 10.h),
          Txt(
            this.review,
            style: TxtStyle()
              ..fontFamily('Avenir')
              ..fontWeight(FontWeight.w600)
              ..textColor(Colors.black87)
              ..fontSize(24.sp),
          )
        ]),
      ),
    );
  }
}
