part of 'job_journey_cubit.dart';

@freezed
abstract class JobJourneyState with _$JobJourneyState {
  const factory JobJourneyState.initial() = Initial;
  const factory JobJourneyState.loading() = Loading;
  const factory JobJourneyState.success(Unit unit) = Success;
  const factory JobJourneyState.failure(JobJourneyFailure failure) = Failure;
}
