import 'dart:typed_data';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/categories_cubit/categories_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/search_page_widgets.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class HomePage extends StatefulWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  const HomePage(
      {Key key,
      this.menuScreenContext,
      this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Uint8List imageData;
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    loadAsset();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 854,
      width: 480,
      allowFontScaling: false,
    );
    final categoriesCubit = BlocProvider.of<CategoriesCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Image
              imageWrapper(),
              SizedBoxResponsive(
                height: 20,
              ),
              ContainerResponsive(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFFC3C5C7),
                ),
                width: 300,
                child: Center(
                  child: ContainerResponsive(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Color(0xFF97999B), width: 1),
                      color: Colors.white,
                    ),
                    width: 280,
                    child: Row(
                      children: [
                        SizedBoxResponsive(
                          width: 10,
                        ),
                        TextResponsive(
                          'What service are you looking for?',
                          style:
                              TextStyle(color: Color(0xFF959394), fontSize: 14),
                        ),
                        Spacer(),
                        Icon(
                          Icons.search,
                          color: Color(0xFF959394),
                          size: 20,
                        ),
                        SizedBoxResponsive(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //List of categories
              BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state) {
                return state.map(
                    initial: (_) => Container(),
                    loading: (_) => Container(),
                    success: (state) {
                      var categories = state.allCategories;

                      return Stack(
                        children: <Widget>[
                          _buildPageView(categories.asList()),
                          _buildCircleIndicator(categories.asList()),
                        ],
                      );
                    },
                    failure: (falure) {
                      return falure.failure.map(
                          serverError: (_) => Center(
                              child: GestureDetector(
                                  onTap: () {
                                    categoriesCubit.getAllCategories();
                                  },
                                  child: ErrorIndicator(
                                      message: SERVER_ERROR_MESSAGE))),
                          noInternet: (_) => Center(
                              child: GestureDetector(
                                  onTap: () {
                                    categoriesCubit.getAllCategories();
                                  },
                                  child: ErrorIndicator(
                                      message: NO_INTERNET_MESSAGE))));
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }

  _buildPageView(List items) {
    return ContainerResponsive(
      height: 315,
      child: PageView.builder(
          itemCount: (items.length / 8).floor() + 1,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            int startIndex = index * 8;
            int endIndex = index * 8 + 7;
            var slicedList = items.sublist(startIndex,
                endIndex + 1 > items.length ? items.length : endIndex + 1);

            return GridView.builder(
              padding: EdgeInsets.only(
                  top: 15.h, left: 20.h, right: 20.h, bottom: 0.h),
              scrollDirection: Axis.vertical,
              itemCount: slicedList.length,
              itemBuilder: (BuildContext context, int index) {
                final category = slicedList[index];

                return CategoryButton(
                    categoryName: category.name, clickable: true);
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.3,
                  crossAxisSpacing: 0.h,
                  mainAxisSpacing: 0.w,
                  crossAxisCount: 4),
            );
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          }),
    );
  }

  _buildCircleIndicator(List items) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: (items.length / 8).floor() + 1,
          dotColor: kBlueBackgroundColor,
          selectedDotColor: Color(0xFFF8973F),
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }

  void loadAsset() async {
    Uint8List data = (await rootBundle.load('assets/images/electrician.jpg'))
        .buffer
        .asUint8List();
    setState(() => this.imageData = data);
  }

  Widget imageWrapper() {
    return imageData == null
        ? Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          )
        : Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: MemoryImage(imageData, scale: 1)),
            ),
          );
  }
}
