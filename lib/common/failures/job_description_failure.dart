import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_description_failure.freezed.dart';

@freezed
abstract class JobDescriptionFailure with _$JobDescriptionFailure {
  const factory JobDescriptionFailure.serverError() = ServerError;
  const factory JobDescriptionFailure.noInternet() = NoInternet;
}
