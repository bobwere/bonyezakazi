// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SearchStateTearOff {
  const _$SearchStateTearOff();

// ignore: unused_element
  _SearchState call(
      {String location,
      String rating,
      String skill,
      bool isSubmitting,
      Option<Either<SearchFailure, KtList<ServiceProvider>>>
          searchFailureOrSuccessOption}) {
    return _SearchState(
      location: location,
      rating: rating,
      skill: skill,
      isSubmitting: isSubmitting,
      searchFailureOrSuccessOption: searchFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $SearchState = _$SearchStateTearOff();

mixin _$SearchState {
  String get location;
  String get rating;
  String get skill;
  bool get isSubmitting;
  Option<Either<SearchFailure, KtList<ServiceProvider>>>
      get searchFailureOrSuccessOption;

  $SearchStateCopyWith<SearchState> get copyWith;
}

abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
  $Res call(
      {String location,
      String rating,
      String skill,
      bool isSubmitting,
      Option<Either<SearchFailure, KtList<ServiceProvider>>>
          searchFailureOrSuccessOption});
}

class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;

  @override
  $Res call({
    Object location = freezed,
    Object rating = freezed,
    Object skill = freezed,
    Object isSubmitting = freezed,
    Object searchFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      location: location == freezed ? _value.location : location as String,
      rating: rating == freezed ? _value.rating : rating as String,
      skill: skill == freezed ? _value.skill : skill as String,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      searchFailureOrSuccessOption: searchFailureOrSuccessOption == freezed
          ? _value.searchFailureOrSuccessOption
          : searchFailureOrSuccessOption
              as Option<Either<SearchFailure, KtList<ServiceProvider>>>,
    ));
  }
}

abstract class _$SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(
          _SearchState value, $Res Function(_SearchState) then) =
      __$SearchStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String location,
      String rating,
      String skill,
      bool isSubmitting,
      Option<Either<SearchFailure, KtList<ServiceProvider>>>
          searchFailureOrSuccessOption});
}

class __$SearchStateCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(
      _SearchState _value, $Res Function(_SearchState) _then)
      : super(_value, (v) => _then(v as _SearchState));

  @override
  _SearchState get _value => super._value as _SearchState;

  @override
  $Res call({
    Object location = freezed,
    Object rating = freezed,
    Object skill = freezed,
    Object isSubmitting = freezed,
    Object searchFailureOrSuccessOption = freezed,
  }) {
    return _then(_SearchState(
      location: location == freezed ? _value.location : location as String,
      rating: rating == freezed ? _value.rating : rating as String,
      skill: skill == freezed ? _value.skill : skill as String,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      searchFailureOrSuccessOption: searchFailureOrSuccessOption == freezed
          ? _value.searchFailureOrSuccessOption
          : searchFailureOrSuccessOption
              as Option<Either<SearchFailure, KtList<ServiceProvider>>>,
    ));
  }
}

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {this.location,
      this.rating,
      this.skill,
      this.isSubmitting,
      this.searchFailureOrSuccessOption});

  @override
  final String location;
  @override
  final String rating;
  @override
  final String skill;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<SearchFailure, KtList<ServiceProvider>>>
      searchFailureOrSuccessOption;

  @override
  String toString() {
    return 'SearchState(location: $location, rating: $rating, skill: $skill, isSubmitting: $isSubmitting, searchFailureOrSuccessOption: $searchFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchState &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.skill, skill) ||
                const DeepCollectionEquality().equals(other.skill, skill)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.searchFailureOrSuccessOption,
                    searchFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.searchFailureOrSuccessOption,
                    searchFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(skill) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(searchFailureOrSuccessOption);

  @override
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {String location,
      String rating,
      String skill,
      bool isSubmitting,
      Option<Either<SearchFailure, KtList<ServiceProvider>>>
          searchFailureOrSuccessOption}) = _$_SearchState;

  @override
  String get location;
  @override
  String get rating;
  @override
  String get skill;
  @override
  bool get isSubmitting;
  @override
  Option<Either<SearchFailure, KtList<ServiceProvider>>>
      get searchFailureOrSuccessOption;
  @override
  _$SearchStateCopyWith<_SearchState> get copyWith;
}
