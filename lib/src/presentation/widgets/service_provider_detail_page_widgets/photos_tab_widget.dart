import 'package:bonyeza_kazi/src/application/reviews_cubit/reviews_cubit.dart';
import 'package:bonyeza_kazi/src/application/service_provider_details_cubit/sp_details_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/portfolio_gallery_detail_page.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/portfolio_gallery_image_widget.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/search_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;
import 'package:bonyeza_kazi/common/constants/style.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PhotosTabWidget extends StatefulWidget {
  const PhotosTabWidget({Key key, @required this.serviceProvider})
      : super(key: key);
  final ServiceProvider serviceProvider;

  @override
  _PhotosTabWidgetState createState() => _PhotosTabWidgetState();
}

class _PhotosTabWidgetState extends State<PhotosTabWidget>
    with AutomaticKeepAliveClientMixin<PhotosTabWidget> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    SPDetailsCubit spDetailsCubit = BlocProvider.of<SPDetailsCubit>(context);
    ReviewsCubit reviewsCubit = BlocProvider.of<ReviewsCubit>(context);
    return BlocBuilder<SPDetailsCubit, SPDetailsState>(
      builder: (context, state) {
        return state.map(
            initial: (_) => Container(),
            loading: (_) => Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 50.h),
                    height: 50.h,
                    width: 50.h,
                    child: load.LoadingIndicator(
                        indicatorType: load.Indicator.ballTrianglePath,
                        color: kBlueBackgroundColor),
                  ),
                ),
            success: (state) {
              final spDetails = state.spDetails;
              final List<String> imageUrls = [];
              if (spDetails.images.contains("|")) {
                final imageUrlStr = spDetails.images.split(" ").join("");

                final imageUrlls = imageUrlStr.split(("|"));

                imageUrls.addAll(imageUrlls);
              } else {
                imageUrls.add(spDetails.images);
              }
              return SafeArea(
                  top: false,
                  bottom: false,
                  child: Builder(builder: (context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>('photos'),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.all(10.h),
                          sliver: _buildContent(imageUrls),
                        ),
                      ],
                    );
                  }));
            },
            failure: (failure) {
              return failure.failure.map(
                  serverError: (_) => GestureDetector(
                        onTap: () {
                          spDetailsCubit.getServiceProviderDetails(
                              id: widget.serviceProvider.id);
                          reviewsCubit.getServiceProviderReviews(
                              id: widget.serviceProvider.id);
                        },
                        child: ErrorIndicator(message: SERVER_ERROR_MESSAGE),
                      ),
                  noInternet: (_) => GestureDetector(
                        onTap: () {
                          spDetailsCubit.getServiceProviderDetails(
                              id: widget.serviceProvider.id);
                          reviewsCubit.getServiceProviderReviews(
                              id: widget.serviceProvider.id);
                        },
                        child: ErrorIndicator(message: NO_INTERNET_MESSAGE),
                      ));
            });
      },
    );
  }

  SliverGrid _buildContent(List<String> imagePaths) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.h,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return PortfolioGalleryImageWidget(
              imagePath: imagePaths[index],
              onImageTap: () {
                pushNewScreen(
                  context,
                  screen: PortfolioGalleryDetailPage(
                      imagePaths: imagePaths, currentIndex: index),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              });
        },
        childCount: imagePaths.length,
      ),
    );
  }
}
