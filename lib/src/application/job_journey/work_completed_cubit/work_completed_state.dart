part of 'work_completed_cubit.dart';

@freezed
abstract class WorkCompletedState with _$WorkCompletedState {
  const factory WorkCompletedState({
    List<Asset> photos,
    bool isSubmitting,
    Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption,
  }) = _WorkCompletedState;

  factory WorkCompletedState.initial() => WorkCompletedState(
        photos: [],
        isSubmitting: false,
        sendingFailureOrSuccessOption: none(),
      );
}
