import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/common/routes/router.gr.dart';
import 'package:bonyeza_kazi/src/application/reviews_cubit/reviews_cubit.dart';
import 'package:bonyeza_kazi/src/application/service_provider_details_cubit/sp_details_cubit.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';
import 'package:latlong/latlong.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';

class SPDetails extends StatelessWidget {
  const SPDetails(
      {Key key,
      @required this.name,
      @required this.rating,
      @required this.skills,
      @required this.location})
      : super(key: key);
  final String name;
  final String rating;
  final String skills;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 200.h),
            child: Text(
              this.name == null ? " " : this.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 21.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 27.h,
                child: Center(
                  child: Text(
                      (this.rating == null) ? "No Ratings" : this.rating,
                      style: TextStyle(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w400,
                          color: kYellowStarColor)),
                ),
              ),
              SizedBox(
                width: 3.h,
              ),
              Container(
                height: 27.h,
                child: Center(
                  child: SmoothStarRating(
                    starCount: 5,
                    isReadOnly: true,
                    size: 23.sp,
                    rating: (this.rating == null)
                        ? 0.0
                        : double.tryParse(this.rating),
                    color: kYellowStarColor,
                    borderColor: kYellowStarColor,
                  ),
                ),
              ),
            ],
          ),
          Text(this.skills,
              style: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54)),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 200.h),
            child: Text(
              this.location == null ? " " : this.location,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 21.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ]);
  }
}

class ListOfServiceProvidersWidget extends StatefulWidget {
  ListOfServiceProvidersWidget({Key key, @required this.serviceProviders})
      : super(key: key);
  final KtList<ServiceProvider> serviceProviders;

  @override
  _ListOfServiceProvidersWidgetState createState() =>
      _ListOfServiceProvidersWidgetState();
}

class _ListOfServiceProvidersWidgetState
    extends State<ListOfServiceProvidersWidget> {
  List<ServiceProvider> newListOfServiceProviders = [];

  Location location = Location();
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  Future<PermissionStatus> _hasPermission() async {
    _permissionGranted = await location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();

      if (_permissionGranted == PermissionStatus.granted) {
        return _permissionGranted;
      }
    }
    return _permissionGranted;
  }

  Future<LocationData> _getUserLocation() async {
    _locationData = await location.getLocation();
    return _locationData;
  }

  @override
  Widget build(BuildContext context) {
    SPDetailsCubit spDetailsCubit = BlocProvider.of<SPDetailsCubit>(context);
    ReviewsCubit reviewsCubit = BlocProvider.of<ReviewsCubit>(context);
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      itemCount: widget.serviceProviders.size,
      itemBuilder: (context, index) {
        final serviceProvider = widget.serviceProviders[index];

        return GestureDetector(
          onTap: () {
            ExtendedNavigator.of(context).push(
              Routes.serviceProviderDetailPage,
              arguments: ServiceProviderDetailPageArguments(
                  serviceProvider: serviceProvider),
            );
            spDetailsCubit.getServiceProviderDetails(id: serviceProvider.id);
            reviewsCubit.getServiceProviderReviews(id: serviceProvider.id);
          },
          child: Container(
            padding: EdgeInsets.only(
                top: 0.h, bottom: 10.h, left: 10.h, right: 10.h),
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15.h)),
                    child: Container(
                      height: 100.h,
                      width: 100.h,
                      child: CachedNetworkImage(
                        width: double.infinity,
                        height: 250.h,
                        imageUrl: serviceProvider.photo,
                        fadeOutDuration: const Duration(milliseconds: 250),
                        fadeInDuration: const Duration(milliseconds: 250),
                        placeholder: (context, url) =>
                            Container(color: randomChoice(kPlaceHolderColors)),
                        errorWidget: (context, url, error) => Icon(Icons.error),
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
                        name: serviceProvider.username,
                        rating: serviceProvider.rating,
                        skills: serviceProvider.skills,
                        location: serviceProvider.location,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                height: 2.h,
              )
            ]),
          ),
        );
      },
    );
    /*   return FutureBuilder(
        future: _hasPermission(),
        builder: (context, permissionSnapshot) {
          if (permissionSnapshot.data == PermissionStatus.granted) {
            return FutureBuilder<LocationData>(
                future: _getUserLocation(),
                builder: (context, locationSnaphot) {
                  if (locationSnaphot.hasData) {
                    final location = locationSnaphot.data;
                    LatLng userCoordinates =
                        LatLng(location.latitude, location.longitude);

                    KtMutableList<ServiceProvider> serviceProviderList =
                        widget.serviceProviders.toMutableList();
                    final Distance distance = Distance();

                    serviceProviderList.forEach((element) {
                      final latLng = coordinates['${element.location}'];
                      final spLatLng =
                          LatLng(latLng.latitude, latLng.longitude);
                      final int distanceFromClient = distance
                          .as(LengthUnit.Kilometer, userCoordinates, spLatLng)
                          .toInt();
                      var newElement =
                          element.copyWith(distance: distanceFromClient);
                      newListOfServiceProviders.add(newElement);
                    });

                    return SpList(
                      serviceEnabled: true,
                      newListOfServiceProviders: newListOfServiceProviders,
                    );
                  } else {
                    return Container();
                  }
                });
          } else if (permissionSnapshot.data == PermissionStatus.denied) {
            return SpList(
              serviceEnabled: false,
              newListOfServiceProviders: widget.serviceProviders.asList(),
            );
          } else if (permissionSnapshot.data ==
              PermissionStatus.deniedForever) {
            return SpList(
              serviceEnabled: false,
              newListOfServiceProviders: widget.serviceProviders.asList(),
            );
          } else {
            return Container();
          }
        });*/
  }
}

class SpList extends StatefulWidget {
  const SpList(
      {Key key,
      @required this.serviceEnabled,
      @required this.newListOfServiceProviders})
      : super(key: key);
  final bool serviceEnabled;

  final List<ServiceProvider> newListOfServiceProviders;
  @override
  _SpListState createState() => _SpListState();
}

class _SpListState extends State<SpList> {
  var _value = 5.0;
  List<ServiceProvider> filteredServiceProviders = [];

  @override
  void initState() {
    super.initState();
    if (widget.serviceEnabled) {
      filteredServiceProviders = widget.newListOfServiceProviders
          .where((i) => i.distance < 5)
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SPDetailsCubit spDetailsCubit = BlocProvider.of<SPDetailsCubit>(context);
    ReviewsCubit reviewsCubit = BlocProvider.of<ReviewsCubit>(context);
    return Column(
      children: [
        widget.serviceEnabled
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextResponsive(
                  "Near Me in (kms)",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              )
            : Container(),
        widget.serviceEnabled
            ? SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: kBlueBackgroundColor,
                  inactiveTrackColor: Colors.blue[100],
                  trackShape: RoundedRectSliderTrackShape(),
                  trackHeight: 4.0,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  thumbColor: Colors.blueAccent,
                  overlayColor: Colors.blue.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                  tickMarkShape: RoundSliderTickMarkShape(),
                  activeTickMarkColor: kBlueBackgroundColor,
                  inactiveTickMarkColor: Colors.blue[100],
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: Colors.blueAccent,
                  valueIndicatorTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Slider(
                  value: _value,
                  min: 5,
                  max: 20,
                  divisions: 5,
                  label: '$_value',
                  onChanged: (value) {
                    setState(
                      () {
                        _value = value;
                        filteredServiceProviders = widget
                            .newListOfServiceProviders
                            .where((i) => i.distance < value)
                            .toList();
                      },
                    );
                  },
                ),
              )
            : Container(),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            itemCount: widget.serviceEnabled
                ? filteredServiceProviders.length
                : widget.newListOfServiceProviders.length,
            itemBuilder: (context, index) {
              final serviceProvider = widget.serviceEnabled
                  ? filteredServiceProviders[index]
                  : widget.newListOfServiceProviders[index];
              return GestureDetector(
                onTap: () {
                  ExtendedNavigator.of(context).push(
                    Routes.serviceProviderDetailPage,
                    arguments: ServiceProviderDetailPageArguments(
                        serviceProvider: serviceProvider),
                  );
                  spDetailsCubit.getServiceProviderDetails(
                      id: serviceProvider.id);
                  reviewsCubit.getServiceProviderReviews(
                      id: serviceProvider.id);
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: 0.h, bottom: 10.h, left: 10.h, right: 10.h),
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15.h)),
                          child: Container(
                            height: 100.h,
                            width: 100.h,
                            child: CachedNetworkImage(
                              width: double.infinity,
                              height: 250.h,
                              imageUrl: serviceProvider.photo,
                              fadeOutDuration:
                                  const Duration(milliseconds: 250),
                              fadeInDuration: const Duration(milliseconds: 250),
                              placeholder: (context, url) => Container(
                                  color: randomChoice(kPlaceHolderColors)),
                              errorWidget: (context, url, error) =>
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
                              name: serviceProvider.username,
                              rating: serviceProvider.rating,
                              skills: serviceProvider.skills,
                              location: serviceProvider.location,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(
                      height: 2.h,
                    )
                  ]),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
