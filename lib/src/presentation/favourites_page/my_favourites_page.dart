import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/src/application/favourites_cubit/favourites_creation_cubit.dart';
import 'package:bonyeza_kazi/src/application/favourites_cubit/favourites_cubit.dart';
import 'package:bonyeza_kazi/src/application/reviews_cubit/reviews_cubit.dart';
import 'package:bonyeza_kazi/src/application/service_provider_details_cubit/sp_details_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/list_of_service_providers_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/search_page_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:division/division.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;

class MyFavouritesPage extends StatelessWidget {
  const MyFavouritesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouritesCreationCubit favouritesCreationCubit =
        BlocProvider.of<FavouritesCreationCubit>(context);
    SPDetailsCubit spDetailsCubit = BlocProvider.of<SPDetailsCubit>(context);
    ReviewsCubit reviewsCubit = BlocProvider.of<ReviewsCubit>(context);
    BlocProvider.of<FavouritesCubit>(context)..getMyFavourites();
    return Scaffold(
        appBar: AppBar(
          title: Txt("My Favourites", style: kAppBarTxtStyle),
          centerTitle: true,
          backgroundColor: kBlueBackgroundColor,
          elevation: 3.h,
        ),
        body: BlocListener<FavouritesCreationCubit, FavouritesCreationState>(
          listener: (context, state) {
            state.maybeMap(
                successfullyDeleted: (_) {
                  Flushbar(
                    title: 'Deleted Successfully',
                    message: 'removed from your favourites',
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
          child: BlocBuilder<FavouritesCubit, FavouritesState>(
            builder: (context, state) {
              return state.map(
                  initial: (_) => Container(),
                  loading: (_) => Center(
                        child: Container(
                          height: 50.h,
                          width: 50.h,
                          child: load.LoadingIndicator(
                              indicatorType: load.Indicator.ballTrianglePath,
                              color: kBlueBackgroundColor),
                        ),
                      ),
                  success: (state) {
                    return state.allFavourites.size == 0
                        ? NoFavouritesFound()
                        : ListView.builder(
                            padding: EdgeInsets.only(top: 20.h, bottom: 70.h),
                            itemCount: state.allFavourites.size,
                            itemBuilder: (context, index) {
                              final favourite = state.allFavourites[index];
                              return Container(
                                padding: EdgeInsets.only(
                                    top: 0.h,
                                    bottom: 10.h,
                                    left: 10.h,
                                    right: 10.h),
                                width: MediaQuery.of(context).size.width,
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          final serviceProvider =
                                              ServiceProvider(
                                                  id: favourite.id,
                                                  name: favourite.name,
                                                  msisdn: favourite.msisdn,
                                                  photo: favourite.imageUrl,
                                                  images: favourite.images,
                                                  location: favourite.location,
                                                  rating: favourite.rating,
                                                  city: favourite.city);
                                          ExtendedNavigator.of(context).push(
                                            Routes.serviceProviderDetailPage,
                                            arguments:
                                                ServiceProviderDetailPageArguments(
                                                    serviceProvider:
                                                        serviceProvider),
                                          );
                                          spDetailsCubit
                                              .getServiceProviderDetails(
                                                  id: serviceProvider.id);
                                          reviewsCubit
                                              .getServiceProviderReviews(
                                                  id: serviceProvider.id);
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.h)),
                                              child: Container(
                                                height: 100.h,
                                                width: 100.h,
                                                child: CachedNetworkImage(
                                                  width: double.infinity,
                                                  height: 250.h,
                                                  imageUrl: favourite.imageUrl,
                                                  fadeOutDuration:
                                                      const Duration(
                                                          milliseconds: 250),
                                                  fadeInDuration:
                                                      const Duration(
                                                          milliseconds: 250),
                                                  placeholder: (context, url) =>
                                                      Container(
                                                          color: randomChoice(
                                                              kPlaceHolderColors)),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.h,
                                            ),
                                            Column(
                                              children: [
                                                SPDetails(
                                                  name: favourite.name,
                                                  rating: favourite.rating,
                                                  skills: favourite.skill,
                                                  location: favourite.location,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            LineAwesomeIcons.alternate_trash_1,
                                            color: Colors.grey,
                                            size: 50.h,
                                          ),
                                          onPressed: () {
                                            favouritesCreationCubit
                                                .deleteFavourites(
                                                    favourites: favourite);
                                          })
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Divider(
                                    height: 2.h,
                                  )
                                ]),
                              );
                            });
                  },
                  failure: (state) {
                    return state.failure.map(serverError: (_) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<FavouritesCubit>(context)
                            ..getMyFavourites();
                        },
                        child: Container(
                          child: Center(
                            child: ErrorIndicator(
                              message: SERVER_ERROR_MESSAGE,
                            ),
                          ),
                        ),
                      );
                    }, noInternet: (_) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<FavouritesCubit>(context)
                            ..getMyFavourites();
                        },
                        child: Container(
                          child: Center(
                            child: ErrorIndicator(
                              message: NO_INTERNET_MESSAGE,
                            ),
                          ),
                        ),
                      );
                    });
                  });
            },
          ),
        ));
  }
}

class NoFavouritesFound extends StatelessWidget {
  const NoFavouritesFound({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: 125.h,
            ),
            Icon(LineAwesomeIcons.dropbox,
                size: 200.sp, color: Color(0xFFA8AEC0)),
            Txt(
              'Your favourites list is empty!',
              style: TxtStyle()
                ..fontFamily('Avenir')
                ..fontWeight(FontWeight.w800)
                ..fontSize(27.sp)
                ..textColor(
                  Color(0xFF7F869A),
                ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Txt(
                'Explore services and add them to favourites to show them here.',
                style: TxtStyle()
                  ..fontFamily('Avenir')
                  ..fontWeight(FontWeight.w800)
                  ..textAlign.center()
                  ..fontSize(23.sp)
                  ..textColor(
                    Color(0xFFBDC0C9),
                  ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
