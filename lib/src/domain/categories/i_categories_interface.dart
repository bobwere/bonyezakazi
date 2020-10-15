import 'package:bonyeza_kazi/common/failures/categories_failure.dart';
import 'package:bonyeza_kazi/common/failures/search_failure.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/casual_categories_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';

import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

abstract class ICasualCategoriesFacade {
  Future<Either<CategoriesFailure, KtList<Categories>>> getAllCategories();
  Future<Either<SearchFailure, KtList<ServiceProvider>>>
      searchForServiceProviders(
          {String skills, String location, String rating});
}
