import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.noInternet() = NoInternet;
  const factory AuthFailure.formValidation(String error) = FormValidation;
  const factory AuthFailure.userNotFound() = UserNotFound;
}
