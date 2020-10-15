import 'dart:typed_data';

import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/auth_cubit/auth_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  Uint8List imageData;
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  final _items = [
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

  @override
  void initState() {
    super.initState();
    loadAsset();
    onboardinPageIsSeen();
  }

  void onboardinPageIsSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(ONBOARDING_PAGE_SEEN, true);
  }

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              imageWrapper(),
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width,
                color: kBlueBackgroundColor,
                child: Center(
                  child: TextResponsive(
                    'Uniting talent with opportunity',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Stack(
                children: <Widget>[
                  _buildPageView(),
                  _buildCircleIndicator(),
                ],
              ),
              SizedBoxResponsive(
                height: 25,
              ),
              BonyezaButton(
                backGroundColor: kGreenBackgroundColor,
                borderRadius: 100,
                margin: 125,
                textColor: Colors.white,
                text: 'Get Started',
                onButtonPressed: () {
                  authCubit.searchFor();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildPageView() {
    return ContainerResponsive(
      // color: Colors.black87,
      height: 315,
      child: PageView.builder(
          itemCount: (_items.length / 8).floor() + 1,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            int startIndex = index * 8;
            int endIndex = index * 8 + 7;
            var slicedList = _items.sublist(startIndex,
                endIndex + 1 > _items.length ? _items.length : endIndex + 1);

            return GridView.builder(
              padding: EdgeInsets.only(
                  top: 15.h, left: 20.h, right: 20.h, bottom: 0.h),
              scrollDirection: Axis.vertical,
              itemCount: slicedList.length,
              itemBuilder: (BuildContext context, int index) {
                final category = slicedList[index];

                return CategoryButton(
                  categoryName: category,
                  clickable: false,
                );
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

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: (_items.length / 8).floor() + 1,
          dotColor: kBlueBackgroundColor,
          selectedDotColor: Color(0xFFF8973F),
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }

  void loadAsset() async {
    Uint8List data = (await rootBundle.load('assets/images/builder.jpg'))
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
        : Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: MemoryImage(imageData, scale: 1)),
                ),
              ),
              Positioned(
                top: 30,
                right: 50,
                child: Container(
                  child: Image.asset(
                    'assets/images/NYAKUA.png',
                    width: 500.w,
                    height: 190.h,
                  ),
                ),
              ),
              Positioned(
                top: 150,
                right: 110,
                child: ContainerResponsive(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xFFD0D2D3),
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
                            style: TextStyle(
                                color: Color(0xFF959394), fontSize: 11),
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
              ),
            ],
          );
  }
}
