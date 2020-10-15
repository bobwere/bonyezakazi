import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_failure.freezed.dart';

@freezed
abstract class ReviewFailure with _$ReviewFailure {
  const factory ReviewFailure.serverError() = ServerError;
  const factory ReviewFailure.noInternet() = NoInternet;
}
