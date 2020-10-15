part of 'jobs_completed_cubit.dart';

@freezed
abstract class JobsCompletedState with _$JobsCompletedState {
  const factory JobsCompletedState.initial() = Initial;
  const factory JobsCompletedState.loading() = Loading;
  const factory JobsCompletedState.success(SpCompletedJobs completedJobs) =
      Success;
  const factory JobsCompletedState.failure(SPDetailsFailure failure) = Failure;
}
