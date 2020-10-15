import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_failure.freezed.dart';

@freezed
abstract class CategoriesFailure with _$CategoriesFailure {
  const factory CategoriesFailure.serverError() = ServerError;
  const factory CategoriesFailure.noInternet() = NoInternet;
}
