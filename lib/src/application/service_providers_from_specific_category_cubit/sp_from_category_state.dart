part of 'sp_from_category_cubit.dart';

@freezed
abstract class SPFromCategoryState with _$SPFromCategoryState {
  const factory SPFromCategoryState.initial() = Initial;
  const factory SPFromCategoryState.loading() = Loading;
  const factory SPFromCategoryState.success(
      KtList<ServiceProvider> serviceProviders) = Success;
  const factory SPFromCategoryState.failure(SearchFailure failure) = Failure;
}
