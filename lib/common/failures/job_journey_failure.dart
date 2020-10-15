import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_journey_failure.freezed.dart';

@freezed
abstract class JobJourneyFailure with _$JobJourneyFailure {
  const factory JobJourneyFailure.serverError() = ServerError;
  const factory JobJourneyFailure.noInternet() = NoInternet;
}
