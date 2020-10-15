import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_update_failure.freezed.dart';

@freezed
abstract class UserUpdateFailure with _$UserUpdateFailure {
  const factory UserUpdateFailure.serverError() = ServerError;
  const factory UserUpdateFailure.noInternet() = NoInternet;
}
