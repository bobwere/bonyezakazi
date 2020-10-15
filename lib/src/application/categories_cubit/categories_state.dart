part of 'categories_cubit.dart';

@freezed
abstract class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = Initial;
  const factory CategoriesState.loading() = Loading;
  const factory CategoriesState.success(KtList<Categories> allCategories) =
      Success;
  const factory CategoriesState.failure(CategoriesFailure failure) = Failure;
}
