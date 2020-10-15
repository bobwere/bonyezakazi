import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/src/application/reviews_cubit/reviews_cubit.dart';
import 'package:bonyeza_kazi/src/application/service_provider_details_cubit/sp_details_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/favourites/models/favourites_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/service_provider/model/service_provider_details_model.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/search_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/overview_tab_button_widget.dart';
import 'package:bonyeza_kazi/src/application/favourites_cubit/favourites_creation_cubit.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_state/flutter_phone_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;
import 'package:share/share.dart';

class OverviewTab extends StatefulWidget {
  const OverviewTab({Key key, @required this.serviceProvider})
      : super(key: key);
  final ServiceProvider serviceProvider;

  @override
  _OverviewTabState createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab>
    with AutomaticKeepAliveClientMixin<OverviewTab> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    FavouritesCreationCubit favouritesCreationCubit =
        BlocProvider.of<FavouritesCreationCubit>(context);
    SPDetailsCubit spDetailsCubit = BlocProvider.of<SPDetailsCubit>(context);
    ReviewsCubit reviewsCubit = BlocProvider.of<ReviewsCubit>(context);
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>('overview'),
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
                        Parent(
                          style: ParentStyle()
                            ..height(140.h)
                            ..background.color(Colors.white)
                            ..boxShadow(
                                offset: Offset(0, 2),
                                blur: kBoxShadowBlur,
                                color: kBoxShadowColor.shade400),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OverviewTabButton(
                                  text: 'BOOK',
                                  icon:
                                      LineAwesomeIcons.calendar_with_day_focus,
                                  onButtonPressed: () {
                                    ExtendedNavigator.of(context).push(
                                        Routes.bookingPage,
                                        arguments: BookingPageArguments(
                                            serviceProvider:
                                                widget.serviceProvider));
                                  }),
                              OverviewTabButton(
                                  text: 'SAVE',
                                  icon: Icons.favorite_border,
                                  onButtonPressed: () {
                                    final favourites = Favourites(
                                      id: widget.serviceProvider.id,
                                      name: widget.serviceProvider.username ??
                                          " ",
                                      skill: widget.serviceProvider.skills,
                                      rating:
                                          widget.serviceProvider.rating ?? null,
                                      imageUrl: widget.serviceProvider.photo,
                                      msisdn: widget.serviceProvider.msisdn,
                                      images: widget.serviceProvider.images,
                                      time: DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString(),
                                      location: widget.serviceProvider.location,
                                      city: widget.serviceProvider.city,
                                    );
                                    favouritesCreationCubit.createFavourites(
                                        favourites: favourites);
                                  }),
                              OverviewTabButton(
                                  text: 'SHARE',
                                  icon: LineAwesomeIcons.share_square,
                                  onButtonPressed: () {
                                    Share.share(SOCIAL_SHARE_MESSAGE);
                                  }),
                              OverviewTabButton(
                                  text: 'CALL',
                                  icon: LineAwesomeIcons.phone,
                                  onButtonPressed: () {
                                    FlutterPhoneState.startPhoneCall(
                                        widget.serviceProvider.msisdn);
                                  }),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      children: [
                        BlocBuilder<SPDetailsCubit, SPDetailsState>(
                          builder: (context, state) {
                            return state.map(
                                initial: (_) => Container(),
                                loading: (_) => Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 50.h),
                                      height: 50.h,
                                      width: 50.h,
                                      child: load.LoadingIndicator(
                                          indicatorType:
                                              load.Indicator.ballTrianglePath,
                                          color: kBlueBackgroundColor),
                                    ),
                                success: (state) {
                                  final spDetails = state.spDetails;
                                  List<WorkDetail> workDetails =
                                      spDetails.workDetails;
                                  return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: workDetails.length,
                                    itemBuilder: (context, index) {
                                      final workDetail = workDetails[index];
                                      return WorkDetailCard(
                                        title: workDetail.workTitle,
                                        description: workDetail.description,
                                        comments: workDetail.comments,
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
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class WorkDetailCard extends StatelessWidget {
  const WorkDetailCard({
    Key key,
    @required this.title,
    @required this.description,
    @required this.comments,
  }) : super(key: key);
  final String title;
  final String description;
  final String comments;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      shadowColor: kBoxShadowColor.shade300,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.h),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Txt(
              this.title ?? " ",
              style: kOverviewTabTextStyle.clone()
                ..textAlign.left()
                ..fontSize(26.sp)
                ..textAlign.left()
                ..fontWeight(FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Txt(
              this.description ?? " ",
              style: kOverviewTabTextStyle.clone()
                ..textAlign.left()
                ..textColor(Colors.black87)
                ..fontSize(22.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Txt(
              this.comments ?? " ",
              style: kOverviewTabTextStyle.clone()
                ..textAlign.left()
                ..textColor(Colors.black54)
                ..fontSize(22.sp),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
