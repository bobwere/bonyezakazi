part of 'sp_details_cubit.dart';

@freezed
abstract class SPDetailsState with _$SPDetailsState {
  const factory SPDetailsState.initial() = Initial;
  const factory SPDetailsState.loading() = Loading;
  const factory SPDetailsState.success(ServiceProviderDetail spDetails) =
      Success;
  const factory SPDetailsState.failure(SPDetailsFailure failure) = Failure;
}
