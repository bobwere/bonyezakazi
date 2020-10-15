// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

// ignore: unused_element
  ServerError serverError() {
    return const ServerError();
  }

// ignore: unused_element
  NoInternet noInternet() {
    return const NoInternet();
  }

// ignore: unused_element
  FormValidation formValidation(String error) {
    return FormValidation(
      error,
    );
  }

// ignore: unused_element
  UserNotFound userNotFound() {
    return const UserNotFound();
  }
}

// ignore: unused_element
const $AuthFailure = _$AuthFailureTearOff();

mixin _$AuthFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result noInternet(),
    @required Result formValidation(String error),
    @required Result userNotFound(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result noInternet(),
    Result formValidation(String error),
    Result userNotFound(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result noInternet(NoInternet value),
    @required Result formValidation(FormValidation value),
    @required Result userNotFound(UserNotFound value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result noInternet(NoInternet value),
    Result formValidation(FormValidation value),
    Result userNotFound(UserNotFound value),
    @required Result orElse(),
  });
}

abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
}

class _$ServerErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(
      ServerError _value, $Res Function(ServerError) _then)
      : super(_value, (v) => _then(v as ServerError));

  @override
  ServerError get _value => super._value as ServerError;
}

class _$ServerError implements ServerError {
  const _$ServerError();

  @override
  String toString() {
    return 'AuthFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result noInternet(),
    @required Result formValidation(String error),
    @required Result userNotFound(),
  }) {
    assert(serverError != null);
    assert(noInternet != null);
    assert(formValidation != null);
    assert(userNotFound != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result noInternet(),
    Result formValidation(String error),
    Result userNotFound(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result noInternet(NoInternet value),
    @required Result formValidation(FormValidation value),
    @required Result userNotFound(UserNotFound value),
  }) {
    assert(serverError != null);
    assert(noInternet != null);
    assert(formValidation != null);
    assert(userNotFound != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result noInternet(NoInternet value),
    Result formValidation(FormValidation value),
    Result userNotFound(UserNotFound value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements AuthFailure {
  const factory ServerError() = _$ServerError;
}

abstract class $NoInternetCopyWith<$Res> {
  factory $NoInternetCopyWith(
          NoInternet value, $Res Function(NoInternet) then) =
      _$NoInternetCopyWithImpl<$Res>;
}

class _$NoInternetCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $NoInternetCopyWith<$Res> {
  _$NoInternetCopyWithImpl(NoInternet _value, $Res Function(NoInternet) _then)
      : super(_value, (v) => _then(v as NoInternet));

  @override
  NoInternet get _value => super._value as NoInternet;
}

class _$NoInternet implements NoInternet {
  const _$NoInternet();

  @override
  String toString() {
    return 'AuthFailure.noInternet()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoInternet);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result noInternet(),
    @required Result formValidation(String error),
    @required Result userNotFound(),
  }) {
    assert(serverError != null);
    assert(noInternet != null);
    assert(formValidation != null);
    assert(userNotFound != null);
    return noInternet();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result noInternet(),
    Result formValidation(String error),
    Result userNotFound(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noInternet != null) {
      return noInternet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result noInternet(NoInternet value),
    @required Result formValidation(FormValidation value),
    @required Result userNotFound(UserNotFound value),
  }) {
    assert(serverError != null);
    assert(noInternet != null);
    assert(formValidation != null);
    assert(userNotFound != null);
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result noInternet(NoInternet value),
    Result formValidation(FormValidation value),
    Result userNotFound(UserNotFound value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class NoInternet implements AuthFailure {
  const factory NoInternet() = _$NoInternet;
}

abstract class $FormValidationCopyWith<$Res> {
  factory $FormValidationCopyWith(
          FormValidation value, $Res Function(FormValidation) then) =
      _$FormValidationCopyWithImpl<$Res>;
  $Res call({String error});
}

class _$FormValidationCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $FormValidationCopyWith<$Res> {
  _$FormValidationCopyWithImpl(
      FormValidation _value, $Res Function(FormValidation) _then)
      : super(_value, (v) => _then(v as FormValidation));

  @override
  FormValidation get _value => super._value as FormValidation;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(FormValidation(
      error == freezed ? _value.error : error as String,
    ));
  }
}

class _$FormValidation implements FormValidation {
  const _$FormValidation(this.error) : assert(error != null);

  @override
  final String error;

  @override
  String toString() {
    return 'AuthFailure.formValidation(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FormValidation &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $FormValidationCopyWith<FormValidation> get copyWith =>
      _$FormValidationCopyWithImpl<FormValidation>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result noInternet(),
    @required Result formValidation(String error),
    @required Result userNotFound(),
  }) {
    assert(serverError != null);
    assert(noInternet != null);
    assert(formValidation != null);
    assert(userNotFound != null);
    return formValidation(error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result noInternet(),
    Result formValidation(String error),
    Result userNotFound(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (formValidation != null) {
      return formValidation(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result noInternet(NoInternet value),
    @required Result formValidation(FormValidation value),
    @required Result userNotFound(UserNotFound value),
  }) {
    assert(serverError != null);
    assert(noInternet != null);
    assert(formValidation != null);
    assert(userNotFound != null);
    return formValidation(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result noInternet(NoInternet value),
    Result formValidation(FormValidation value),
    Result userNotFound(UserNotFound value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (formValidation != null) {
      return formValidation(this);
    }
    return orElse();
  }
}

abstract class FormValidation implements AuthFailure {
  const factory FormValidation(String error) = _$FormValidation;

  String get error;
  $FormValidationCopyWith<FormValidation> get copyWith;
}

abstract class $UserNotFoundCopyWith<$Res> {
  factory $UserNotFoundCopyWith(
          UserNotFound value, $Res Function(UserNotFound) then) =
      _$UserNotFoundCopyWithImpl<$Res>;
}

class _$UserNotFoundCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $UserNotFoundCopyWith<$Res> {
  _$UserNotFoundCopyWithImpl(
      UserNotFound _value, $Res Function(UserNotFound) _then)
      : super(_value, (v) => _then(v as UserNotFound));

  @override
  UserNotFound get _value => super._value as UserNotFound;
}

class _$UserNotFound implements UserNotFound {
  const _$UserNotFound();

  @override
  String toString() {
    return 'AuthFailure.userNotFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UserNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result noInternet(),
    @required Result formValidation(String error),
    @required Result userNotFound(),
  }) {
    assert(serverError != null);
    assert(noInternet != null);
    assert(formValidation != null);
    assert(userNotFound != null);
    return userNotFound();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result noInternet(),
    Result formValidation(String error),
    Result userNotFound(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userNotFound != null) {
      return userNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result noInternet(NoInternet value),
    @required Result formValidation(FormValidation value),
    @required Result userNotFound(UserNotFound value),
  }) {
    assert(serverError != null);
    assert(noInternet != null);
    assert(formValidation != null);
    assert(userNotFound != null);
    return userNotFound(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result noInternet(NoInternet value),
    Result formValidation(FormValidation value),
    Result userNotFound(UserNotFound value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userNotFound != null) {
      return userNotFound(this);
    }
    return orElse();
  }
}

abstract class UserNotFound implements AuthFailure {
  const factory UserNotFound() = _$UserNotFound;
}
