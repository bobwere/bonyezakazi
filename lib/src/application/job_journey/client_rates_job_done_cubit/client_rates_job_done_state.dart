part of 'client_rates_job_done_cubit.dart';

@freezed
abstract class ClientRatesJobDoneState with _$ClientRatesJobDoneState {
  const factory ClientRatesJobDoneState({
    String rating,
    bool isSubmitting,
    Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption,
  }) = _ClientRatesJobDoneState;

  factory ClientRatesJobDoneState.initial() => ClientRatesJobDoneState(
        rating: '1',
        isSubmitting: false,
        sendingFailureOrSuccessOption: none(),
      );
}
