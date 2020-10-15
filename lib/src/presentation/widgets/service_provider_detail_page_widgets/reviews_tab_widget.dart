import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/reviews_cubit/reviews_cubit.dart';
import 'package:bonyeza_kazi/src/application/service_provider_details_cubit/sp_details_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/overview_tab_widget.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;
import 'package:bonyeza_kazi/src/presentation/widgets/search_page_widgets.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewsTabWidget extends StatefulWidget {
  const ReviewsTabWidget({Key key, @required this.serviceProvider})
      : super(key: key);
  final ServiceProvider serviceProvider;

  @override
  _ReviewsTabWidgetState createState() => _ReviewsTabWidgetState();
}

class _ReviewsTabWidgetState extends State<ReviewsTabWidget>
    with AutomaticKeepAliveClientMixin<ReviewsTabWidget> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    SPDetailsCubit spDetailsCubit = BlocProvider.of<SPDetailsCubit>(context);
    ReviewsCubit reviewsCubit = BlocProvider.of<ReviewsCubit>(context);
    return SafeArea(
        top: false,
        bottom: false,
        child: Builder(builder: (context) {
          return CustomScrollView(
            key: PageStorageKey<String>('reviews'),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Parent(
                          style: ParentStyle()
                            ..height(200.h)
                            ..width(200.h)
                            ..background.color(Colors.white)
                            ..borderRadius(all: 1000.h)
                            ..boxShadow(
                                offset: kBoxShadowOffset,
                                color: kBoxShadowColor,
                                blur: kBoxShadowBlur),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Txt(
                                  (widget.serviceProvider.rating == null)
                                      ? "No Ratings"
                                      : widget.serviceProvider.rating,
                                  style: TxtStyle()
                                    ..fontFamily('Avenir')
                                    ..textAlign.center()
                                    ..fontWeight(FontWeight.w900)
                                    ..fontSize(40.sp)),
                              SmoothStarRating(
                                starCount: 5,
                                isReadOnly: true,
                                size: 23.sp,
                                rating: (widget.serviceProvider.rating == null)
                                    ? 0.0
                                    : double.tryParse(
                                        widget.serviceProvider.rating),
                                color: kYellowStarColor,
                                borderColor: kYellowStarColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Parent(
                          style: ParentStyle()
                            ..height(2.h)
                            ..background.color(Colors.grey.shade300),
                        ),
                        Parent(
                          style: ParentStyle()
                            ..height(150.h)
                            ..background.color(Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Txt('Rate And Review',
                                  style: TxtStyle()
                                    ..fontFamily('Avenir')
                                    ..fontWeight(FontWeight.w800)
                                    ..textColor(Colors.black87)
                                    ..fontSize(30.sp)),
                              Txt('Share your experience to help others',
                                  style: TxtStyle()
                                    ..fontFamily('Avenir')
                                    ..fontWeight(FontWeight.w600)
                                    ..textColor(Colors.black45)
                                    ..fontSize(23.sp)),
                              SmoothStarRating(
                                starCount: 5,
                                size: 45.sp,
                                rating: 0.0,
                                onRated: (value) {
                                  print(value);
                                },
                                color: kYellowStarColor,
                                borderColor: kYellowStarColor,
                                allowHalfRating: true,
                              ),
                            ],
                          ),
                        ),
                        Parent(
                          style: ParentStyle()
                            ..height(2.h)
                            ..background.color(Colors.grey.shade300),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Txt('Reviews',
                                style: TxtStyle()
                                  ..fontFamily('Avenir')
                                  ..fontWeight(FontWeight.w800)
                                  ..textColor(Colors.black87)
                                  ..fontSize(30.sp)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Column(
                  children: [
                    BlocBuilder<ReviewsCubit, ReviewsState>(
                      builder: (context, state) {
                        return state.map(
                            initial: (_) => Container(),
                            loading: (_) => Center(
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(vertical: 50.h),
                                    height: 50.h,
                                    width: 50.h,
                                    child: load.LoadingIndicator(
                                        indicatorType:
                                            load.Indicator.ballTrianglePath,
                                        color: kBlueBackgroundColor),
                                  ),
                                ),
                            success: (state) {
                              final spReviews = state.spReviews;

                              return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: spReviews.size,
                                itemBuilder: (context, index) {
                                  final spReview = spReviews[index];

                                  return WorkDetailCard(
                                    title: spReview.workTitle,
                                    description: spReview.description,
                                    comments: spReview.comments,
                                  );
                                },
                              );
                            },
                            failure: (failure) {
                              return failure.failure.map(
                                  serverError: (_) => GestureDetector(
                                        onTap: () {
                                          spDetailsCubit
                                              .getServiceProviderDetails(
                                                  id: widget
                                                      .serviceProvider.id);
                                          reviewsCubit
                                              .getServiceProviderReviews(
                                                  id: widget
                                                      .serviceProvider.id);
                                        },
                                        child: ErrorIndicator(
                                            message: SERVER_ERROR_MESSAGE),
                                      ),
                                  noInternet: (_) => GestureDetector(
                                        onTap: () {
                                          spDetailsCubit
                                              .getServiceProviderDetails(
                                                  id: widget
                                                      .serviceProvider.id);
                                          reviewsCubit
                                              .getServiceProviderReviews(
                                                  id: widget
                                                      .serviceProvider.id);
                                        },
                                        child: ErrorIndicator(
                                            message: NO_INTERNET_MESSAGE),
                                      ));
                            });
                      },
                    ),
                  ],
                )
              ])),
            ],
          );
        }));
  }
}
