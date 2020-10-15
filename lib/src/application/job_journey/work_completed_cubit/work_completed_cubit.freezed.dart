// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'work_completed_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$WorkCompletedStateTearOff {
  const _$WorkCompletedStateTearOff();

// ignore: unused_element
  _WorkCompletedState call(
      {List<Asset> photos,
      bool isSubmitting,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption}) {
    return _WorkCompletedState(
      photos: photos,
      isSubmitting: isSubmitting,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $WorkCompletedState = _$WorkCompletedStateTearOff();

mixin _$WorkCompletedState {
  List<Asset> get photos;
  bool get isSubmitting;
  Option<Either<JobJourneyFailure, Unit>> get sendingFailureOrSuccessOption;

  $WorkCompletedStateCopyWith<WorkCompletedState> get copyWith;
}

abstract class $WorkCompletedStateCopyWith<$Res> {
  factory $WorkCompletedStateCopyWith(
          WorkCompletedState value, $Res Function(WorkCompletedState) then) =
      _$WorkCompletedStateCopyWithImpl<$Res>;
  $Res call(
      {List<Asset> photos,
      bool isSubmitting,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption});
}

class _$WorkCompletedStateCopyWithImpl<$Res>
    implements $WorkCompletedStateCopyWith<$Res> {
  _$WorkCompletedStateCopyWithImpl(this._value, this._then);

  final WorkCompletedState _value;
  // ignore: unused_field
  final $Res Function(WorkCompletedState) _then;

  @override
  $Res call({
    Object photos = freezed,
    Object isSubmitting = freezed,
    Object sendingFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      photos: photos == freezed ? _value.photos : photos as List<Asset>,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption == freezed
          ? _value.sendingFailureOrSuccessOption
          : sendingFailureOrSuccessOption
              as Option<Either<JobJourneyFailure, Unit>>,
    ));
  }
}

abstract class _$WorkCompletedStateCopyWith<$Res>
    implements $WorkCompletedStateCopyWith<$Res> {
  factory _$WorkCompletedStateCopyWith(
          _WorkCompletedState value, $Res Function(_WorkCompletedState) then) =
      __$WorkCompletedStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Asset> photos,
      bool isSubmitting,
      Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption});
}

class __$WorkCompletedStateCopyWithImpl<$Res>
    extends _$WorkCompletedStateCopyWithImpl<$Res>
    implements _$WorkCompletedStateCopyWith<$Res> {
  __$WorkCompletedStateCopyWithImpl(
      _WorkCompletedState _value, $Res Function(_WorkCompletedState) _then)
      : super(_value, (v) => _then(v as _WorkCompletedState));

  @override
  _WorkCompletedState get _value => super._value as _WorkCompletedState;

  @override
  $Res call({
    Object photos = freezed,
    Object isSubmitting = freezed,
    Object sendingFailureOrSuccessOption = freezed,
  }) {
    return _then(_WorkCompletedState(
      photos: photos == freezed ? _value.photos : photos as List<Asset>,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption == freezed
          ? _value.sendingFailureOrSuccessOption
          : sendingFailureOrSuccessOption
              as Option<Either<JobJourneyFailure, Unit>>,
    ));
  }
}

class _$_WorkCompletedState implements _WorkCompletedState {
  const _$_WorkCompletedState(
      {this.photos, this.isSubmitting, this.sendingFailureOrSuccessOption});

  @override
  final List<Asset> photos;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<JobJourneyFailure, Unit>> sendingFailureOrSuccessOption;

  @override
  String toString() {
    return 'WorkCompletedState(photos: $photos, isSubmitting: $isSubmitting, sendingFailureOrSuccessOption: $sendingFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WorkCompletedState &&
            (identical(other.photos, photos) ||
                const DeepCollectionEquality().equals(other.photos, photos)) &&
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
      const DeepCollectionEquality().hash(photos) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(sendingFailureOrSuccessOption);

  @override
  _$WorkCompletedStateCopyWith<_WorkCompletedState> get copyWith =>
      __$WorkCompletedStateCopyWithImpl<_WorkCompletedState>(this, _$identity);
}

abstract class _WorkCompletedState implements WorkCompletedState {
  const factory _WorkCompletedState(
      {List<Asset> photos,
      bool isSubmitting,
      Option<Either<JobJourneyFailure, Unit>>
          sendingFailureOrSuccessOption}) = _$_WorkCompletedState;

  @override
  List<Asset> get photos;
  @override
  bool get isSubmitting;
  @override
  Option<Either<JobJourneyFailure, Unit>> get sendingFailureOrSuccessOption;
  @override
  _$WorkCompletedStateCopyWith<_WorkCompletedState> get copyWith;
}
