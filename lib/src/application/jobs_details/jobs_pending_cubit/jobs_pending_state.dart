part of 'jobs_pending_cubit.dart';

@freezed
abstract class JobsPendingState with _$JobsPendingState {
  const factory JobsPendingState.initial() = Initial;
  const factory JobsPendingState.loading() = Loading;
  const factory JobsPendingState.success(
    SpPendingJobs pendingJobs,
  ) = Success;
  const factory JobsPendingState.failure(SPDetailsFailure failure) = Failure;
}
