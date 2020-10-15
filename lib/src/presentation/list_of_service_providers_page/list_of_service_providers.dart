import 'package:auto_route/auto_route.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/service_providers_from_specific_category_cubit/sp_from_category_cubit.dart';
import 'package:bonyeza_kazi/src/presentation/profile_page/jobs_detail_page.dart';

import 'package:bonyeza_kazi/src/presentation/widgets/list_of_service_providers_page_widgets.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/search_page_widgets.dart';
import 'package:division/division.dart';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;

class ListOfServiceProviders extends StatelessWidget {
  const ListOfServiceProviders({Key key, @required this.title})
      : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    SPFromCategoryCubit spFromCategoryCubit =
        BlocProvider.of<SPFromCategoryCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Txt(this.title, style: kAppBarTxtStyle),
        centerTitle: true,
        backgroundColor: kBlueBackgroundColor,
        elevation: 3.h,
      ),
      body: BlocBuilder<SPFromCategoryCubit, SPFromCategoryState>(
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
                final serviceProviders = state.serviceProviders;
                return serviceProviders.size != 0
                    ? ListOfServiceProvidersWidget(
                        serviceProviders: serviceProviders)
                    : NoJobsFound(typeOfJob: '$title services');
              },
              failure: (falure) {
                return falure.failure.map(
                    serverError: (_) => Center(
                        child: GestureDetector(
                            onTap: () {
                              spFromCategoryCubit
                                  .searchForServiceProvidersByCategory(
                                      skills: this.title);
                            },
                            child:
                                ErrorIndicator(message: SERVER_ERROR_MESSAGE))),
                    noInternet: (_) => Center(
                        child: GestureDetector(
                            onTap: () {
                              spFromCategoryCubit
                                  .searchForServiceProvidersByCategory(
                                      skills: this.title);
                            },
                            child:
                                ErrorIndicator(message: NO_INTERNET_MESSAGE))));
              });
        },
      ),
    );
  }
}
