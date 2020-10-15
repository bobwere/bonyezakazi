part of 'jobs_in_progress_cubit.dart';

@freezed
abstract class JobsInProgressState with _$JobsInProgressState {
  const factory JobsInProgressState.initial() = Initial;
  const factory JobsInProgressState.loading() = Loading;
  const factory JobsInProgressState.success(
    SpInProgressJobs jobsInProgress,
  ) = Success;
  const factory JobsInProgressState.failure(SPDetailsFailure failure) = Failure;
}
