import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/favourites_cubit/favourites_creation_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/overview_tab_widget.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/photos_tab_widget.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/reviews_tab_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ServiceProviderDetailPage extends StatefulWidget {
  const ServiceProviderDetailPage({Key key, @required this.serviceProvider})
      : super(key: key);
  final ServiceProvider serviceProvider;
  @override
  _ServiceProviderDetailPageState createState() =>
      _ServiceProviderDetailPageState();
}

class _ServiceProviderDetailPageState extends State<ServiceProviderDetailPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<FavouritesCreationCubit, FavouritesCreationState>(
            listener: (context, state) {
              state.maybeMap(
                  successfullyCreated: (_) {
                    Flushbar(
                      title: 'Successfully Saved',
                      message: 'Added to your favourites',
                      margin: EdgeInsets.all(20.h),
                      flushbarPosition: FlushbarPosition.TOP,
                      duration: Duration(seconds: 3),
                      isDismissible: true,
                      backgroundColor: Colors.green,
                      borderRadius: 15.h,
                    ).show(context);
                  },
                  failure: (state) {
                    state.failure.map(serverError: (_) {
                      Flushbar(
                        title: 'An Error Occurred',
                        message: SERVER_ERROR_MESSAGE,
                        margin: EdgeInsets.all(20.h),
                        flushbarPosition: FlushbarPosition.TOP,
                        duration: Duration(seconds: 3),
                        isDismissible: true,
                        backgroundColor: Color(0xFFFD9726),
                        borderRadius: 15.h,
                      ).show(context);
                    }, noInternet: (_) {
                      Flushbar(
                        title: 'An Error Occurred',
                        message: NO_INTERNET_MESSAGE,
                        margin: EdgeInsets.all(20.h),
                        flushbarPosition: FlushbarPosition.TOP,
                        duration: Duration(seconds: 3),
                        isDismissible: true,
                        backgroundColor: Color(0xFFFD9726),
                        borderRadius: 15.h,
                      ).show(context);
                    });
                  },
                  orElse: () {});
            },
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                List<String> imageUrls = [];
                try {
                  if (widget.serviceProvider.images.contains("|")) {
                    final imageUrlStr =
                        widget.serviceProvider.images.split(" ").join("");

                    final imageUrlls = imageUrlStr.split(("|"));

                    imageUrls.addAll(imageUrlls);
                  } else {
                    imageUrls.add(widget.serviceProvider.images);
                  }
                } catch (e) {}

                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      title: Txt(widget.serviceProvider.username ?? " ",
                          style: kAppBarTxtStyle.clone()
                            ..textColor(Colors.black87)),
                      backgroundColor: Colors.white,
                      iconTheme: ThemeData()
                          .primaryIconTheme
                          .copyWith(color: Colors.black87),
                      pinned: true,
                      expandedHeight: 320.h,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 70.h),
                                SizedBox(
                                  height: 190.h,
                                  child: ListView.builder(
                                    padding: EdgeInsets.fromLTRB(
                                        20.h, 20.h, 0.h, 20.h),
                                    itemCount: imageUrls.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Parent(
                                        style: ParentStyle()
                                          ..boxShadow(
                                            color: kBoxShadowColor,
                                            offset: kBoxShadowOffset,
                                            blur: kBoxShadowBlur,
                                          )
                                          ..width(200.h)
                                          ..borderRadius(all: 15.h)
                                          ..margin(right: 20.h)
                                          ..background.color(Colors.green),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.h)),
                                          child: CachedNetworkImage(
                                            width: double.infinity,
                                            height: 200.h,
                                            imageUrl: imageUrls[index],
                                            placeholder: (context, url) {
                                              return Container(
                                                color: randomChoice<Color>(
                                                    kPlaceHolderColors),
                                              );
                                            },
                                            fadeOutDuration: const Duration(
                                                milliseconds: 250),
                                            fadeInDuration: const Duration(
                                                milliseconds: 250),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.h),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width -
                                                40.w),
                                    child: Text(
                                      widget.serviceProvider.username ?? " ",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontSize: 33.sp,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      forceElevated: innerBoxIsScrolled,
                      bottom: TabBar(
                        controller: _controller,
                        indicator: DotIndicator(
                          color: kBlueBackgroundColor,
                          distanceFromCenter: 16,
                          radius: 3,
                          paintingStyle: PaintingStyle.fill,
                        ),
                        indicatorColor: kBlueBackgroundColor,
                        labelColor: kBlueBackgroundColor,
                        labelStyle: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w800,
                            fontSize: 20.sp),
                        unselectedLabelColor: CupertinoColors.systemGrey,
                        isScrollable: true,
                        tabs: <Widget>[
                          Tab(
                            text: "OVERVIEW",
                          ),
                          Tab(
                            text: "PHOTOS",
                          ),
                          Tab(
                            text: "REVIEWS",
                          ),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(controller: _controller, children: [
                OverviewTab(
                  serviceProvider: widget.serviceProvider,
                ),
                PhotosTabWidget(
                  serviceProvider: widget.serviceProvider,
                ),
                ReviewsTabWidget(serviceProvider: widget.serviceProvider),
              ]),
            )));
  }
}
