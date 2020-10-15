// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'client_rates_job_done_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ClientRatesJobDoneStateTearOff {
  const _$ClientRatesJobDoneStateTearOff();

// ignore: unused_element
  _ClientRatesJobDoneState call(
      {String rating,
      bool isSubmitting,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption}) {
    return _ClientRatesJobDoneState(
      rating: rating,
      isSubmitting: isSubmitting,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $ClientRatesJobDoneState = _$ClientRatesJobDoneStateTearOff();

mixin _$ClientRatesJobDoneState {
  String get rating;
  bool get isSubmitting;
  Option<Either<JobJourneyFailure, Unit>> get sendingFailureOrSuccessOption;

  $ClientRatesJobDoneStateCopyWith<ClientRatesJobDoneState> get copyWith;
}

abstract class $ClientRatesJobDoneStateCopyWith<$Res> {
  factory $ClientRatesJobDoneStateCopyWith(ClientRatesJobDoneState value,
          $Res Function(ClientRatesJobDoneState) then) =
      _$ClientRatesJobDoneStateCopyWithImpl<$Res>;
  $Res call(
      {String rating,
      bool isSubmitting,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption});
}

class _$ClientRatesJobDoneStateCopyWithImpl<$Res>
    implements $ClientRatesJobDoneStateCopyWith<$Res> {
  _$ClientRatesJobDoneStateCopyWithImpl(this._value, this._then);

  final ClientRatesJobDoneState _value;
  // ignore: unused_field
  final $Res Function(ClientRatesJobDoneState) _then;

  @override
  $Res call({
    Object rating = freezed,
    Object isSubmitting = freezed,
    Object sendingFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      rating: rating == freezed ? _value.rating : rating as String,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption == freezed
          ? _value.sendingFailureOrSuccessOption
          : sendingFailureOrSuccessOption
              as Option<Either<JobJourneyFailure, Unit>>,
    ));
  }
}

abstract class _$ClientRatesJobDoneStateCopyWith<$Res>
    implements $ClientRatesJobDoneStateCopyWith<$Res> {
  factory _$ClientRatesJobDoneStateCopyWith(_ClientRatesJobDoneState value,
          $Res Function(_ClientRatesJobDoneState) then) =
      __$ClientRatesJobDoneStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String rating,
      bool isSubmitting,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption});
}

class __$ClientRatesJobDoneStateCopyWithImpl<$Res>
    extends _$ClientRatesJobDoneStateCopyWithImpl<$Res>
    implements _$ClientRatesJobDoneStateCopyWith<$Res> {
  __$ClientRatesJobDoneStateCopyWithImpl(_ClientRatesJobDoneState _value,
      $Res Function(_ClientRatesJobDoneState) _then)
      : super(_value, (v) => _then(v as _ClientRatesJobDoneState));

  @override
  _ClientRatesJobDoneState get _value =>
      super._value as _ClientRatesJobDoneState;

  @override
  $Res call({
    Object rating = freezed,
    Object isSubmitting = freezed,
    Object sendingFailureOrSuccessOption = freezed,
  }) {
    return _then(_ClientRatesJobDoneState(
      rating: rating == freezed ? _value.rating : rating as String,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption == freezed
          ? _value.sendingFailureOrSuccessOption
          : sendingFailureOrSuccessOption
              as Option<Either<JobJourneyFailure, Unit>>,
    ));
  }
}

class _$_ClientRatesJobDoneState implements _ClientRatesJobDoneState {
  const _$_ClientRatesJobDoneState(
      {this.rating, this.isSubmitting, this.sendingFailureOrSuccessOption});

  @override
  final String rating;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption;

  @override
  String toString() {
    return 'ClientRatesJobDoneState(rating: $rating, isSubmitting: $isSubmitting, sendingFailureOrSuccessOption: $sendingFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ClientRatesJobDoneState &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.sendingFailureOrSuccessOption,
                    sendingFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.sendingFailureOrSuccessOption,
                    sendingFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(sendingFailureOrSuccessOption);

  @override
  _$ClientRatesJobDoneStateCopyWith<_ClientRatesJobDoneState> get copyWith =>
      __$ClientRatesJobDoneStateCopyWithImpl<_ClientRatesJobDoneState>(
          this, _$identity);
}

abstract class _ClientRatesJobDoneState implements ClientRatesJobDoneState {
  const factory _ClientRatesJobDoneState(
      {String rating,
      bool isSubmitting,
      Option<Either<JobJourneyFailure, Unit>>
          sendingFailureOrSuccessOption}) = _$_ClientRatesJobDoneState;

  @override
  String get rating;
  @override
  bool get isSubmitting;
  @override
  Option<Either<JobJourneyFailure, Unit>> get sendingFailureOrSuccessOption;
  @override
  _$ClientRatesJobDoneStateCopyWith<_ClientRatesJobDoneState> get copyWith;
}
