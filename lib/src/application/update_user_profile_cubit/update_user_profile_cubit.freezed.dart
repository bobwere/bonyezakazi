// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'update_user_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$UpdateUserProfileStateTearOff {
  const _$UpdateUserProfileStateTearOff();

// ignore: unused_element
  _UpdateUserProfileState call(
      {@required
          String username,
      @required
          String password,
      @required
          String id,
      @required
          String city,
      @required
          String location,
      @required
          String phone,
      @required
          File photo,
      List<Asset> workPhotos,
      String skill,
      @required
          String dialcode,
      @required
          bool isSubmitting,
      @required
          Option<Either<UserUpdateFailure, UpdateUserProfileModelData>>
              userUpdateFailureOrSuccessOption}) {
    return _UpdateUserProfileState(
      username: username,
      password: password,
      id: id,
      city: city,
      location: location,
      phone: phone,
      photo: photo,
      workPhotos: workPhotos,
      skill: skill,
      dialcode: dialcode,
      isSubmitting: isSubmitting,
      userUpdateFailureOrSuccessOption: userUpdateFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $UpdateUserProfileState = _$UpdateUserProfileStateTearOff();

mixin _$UpdateUserProfileState {
  String get username;
  String get password;
  String get id;
  String get city;
  String get location;
  String get phone;
  File get photo;
  List<Asset> get workPhotos;
  String get skill;
  String get dialcode;
  bool get isSubmitting;
  Option<Either<UserUpdateFailure, UpdateUserProfileModelData>>
      get userUpdateFailureOrSuccessOption;

  $UpdateUserProfileStateCopyWith<UpdateUserProfileState> get copyWith;
}

abstract class $UpdateUserProfileStateCopyWith<$Res> {
  factory $UpdateUserProfileStateCopyWith(UpdateUserProfileState value,
          $Res Function(UpdateUserProfileState) then) =
      _$UpdateUserProfileStateCopyWithImpl<$Res>;
  $Res call(
      {String username,
      String password,
      String id,
      String city,
      String location,
      String phone,
      File photo,
      List<Asset> workPhotos,
      String skill,
      String dialcode,
      bool isSubmitting,
      Option<Either<UserUpdateFailure, UpdateUserProfileModelData>>
          userUpdateFailureOrSuccessOption});
}

class _$UpdateUserProfileStateCopyWithImpl<$Res>
    implements $UpdateUserProfileStateCopyWith<$Res> {
  _$UpdateUserProfileStateCopyWithImpl(this._value, this._then);

  final UpdateUserProfileState _value;
  // ignore: unused_field
  final $Res Function(UpdateUserProfileState) _then;

  @override
  $Res call({
    Object username = freezed,
    Object password = freezed,
    Object id = freezed,
    Object city = freezed,
    Object location = freezed,
    Object phone = freezed,
    Object photo = freezed,
    Object workPhotos = freezed,
    Object skill = freezed,
    Object dialcode = freezed,
    Object isSubmitting = freezed,
    Object userUpdateFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed ? _value.username : username as String,
      password: password == freezed ? _value.password : password as String,
      id: id == freezed ? _value.id : id as String,
      city: city == freezed ? _value.city : city as String,
      location: location == freezed ? _value.location : location as String,
      phone: phone == freezed ? _value.phone : phone as String,
      photo: photo == freezed ? _value.photo : photo as File,
      workPhotos:
          workPhotos == freezed ? _value.workPhotos : workPhotos as List<Asset>,
      skill: skill == freezed ? _value.skill : skill as String,
      dialcode: dialcode == freezed ? _value.dialcode : dialcode as String,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      userUpdateFailureOrSuccessOption: userUpdateFailureOrSuccessOption ==
              freezed
          ? _value.userUpdateFailureOrSuccessOption
          : userUpdateFailureOrSuccessOption
              as Option<Either<UserUpdateFailure, UpdateUserProfileModelData>>,
    ));
  }
}

abstract class _$UpdateUserProfileStateCopyWith<$Res>
    implements $UpdateUserProfileStateCopyWith<$Res> {
  factory _$UpdateUserProfileStateCopyWith(_UpdateUserProfileState value,
          $Res Function(_UpdateUserProfileState) then) =
      __$UpdateUserProfileStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String username,
      String password,
      String id,
      String city,
      String location,
      String phone,
      File photo,
      List<Asset> workPhotos,
      String skill,
      String dialcode,
      bool isSubmitting,
      Option<Either<UserUpdateFailure, UpdateUserProfileModelData>>
          userUpdateFailureOrSuccessOption});
}

class __$UpdateUserProfileStateCopyWithImpl<$Res>
    extends _$UpdateUserProfileStateCopyWithImpl<$Res>
    implements _$UpdateUserProfileStateCopyWith<$Res> {
  __$UpdateUserProfileStateCopyWithImpl(_UpdateUserProfileState _value,
      $Res Function(_UpdateUserProfileState) _then)
      : super(_value, (v) => _then(v as _UpdateUserProfileState));

  @override
  _UpdateUserProfileState get _value => super._value as _UpdateUserProfileState;

  @override
  $Res call({
    Object username = freezed,
    Object password = freezed,
    Object id = freezed,
    Object city = freezed,
    Object location = freezed,
    Object phone = freezed,
    Object photo = freezed,
    Object workPhotos = freezed,
    Object skill = freezed,
    Object dialcode = freezed,
    Object isSubmitting = freezed,
    Object userUpdateFailureOrSuccessOption = freezed,
  }) {
    return _then(_UpdateUserProfileState(
      username: username == freezed ? _value.username : username as String,
      password: password == freezed ? _value.password : password as String,
      id: id == freezed ? _value.id : id as String,
      city: city == freezed ? _value.city : city as String,
      location: location == freezed ? _value.location : location as String,
      phone: phone == freezed ? _value.phone : phone as String,
      photo: photo == freezed ? _value.photo : photo as File,
      workPhotos:
          workPhotos == freezed ? _value.workPhotos : workPhotos as List<Asset>,
      skill: skill == freezed ? _value.skill : skill as String,
      dialcode: dialcode == freezed ? _value.dialcode : dialcode as String,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      userUpdateFailureOrSuccessOption: userUpdateFailureOrSuccessOption ==
              freezed
          ? _value.userUpdateFailureOrSuccessOption
          : userUpdateFailureOrSuccessOption
              as Option<Either<UserUpdateFailure, UpdateUserProfileModelData>>,
    ));
  }
}

class _$_UpdateUserProfileState implements _UpdateUserProfileState {
  const _$_UpdateUserProfileState(
      {@required this.username,
      @required this.password,
      @required this.id,
      @required this.city,
      @required this.location,
      @required this.phone,
      @required this.photo,
      this.workPhotos,
      this.skill,
      @required this.dialcode,
      @required this.isSubmitting,
      @required this.userUpdateFailureOrSuccessOption})
      : assert(username != null),
        assert(password != null),
        assert(id != null),
        assert(city != null),
        assert(location != null),
        assert(phone != null),
        assert(photo != null),
        assert(dialcode != null),
        assert(isSubmitting != null),
        assert(userUpdateFailureOrSuccessOption != null);

  @override
  final String username;
  @override
  final String password;
  @override
  final String id;
  @override
  final String city;
  @override
  final String location;
  @override
  final String phone;
  @override
  final File photo;
  @override
  final List<Asset> workPhotos;
  @override
  final String skill;
  @override
  final String dialcode;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<UserUpdateFailure, UpdateUserProfileModelData>>
      userUpdateFailureOrSuccessOption;

  @override
  String toString() {
    return 'UpdateUserProfileState(username: $username, password: $password, id: $id, city: $city, location: $location, phone: $phone, photo: $photo, workPhotos: $workPhotos, skill: $skill, dialcode: $dialcode, isSubmitting: $isSubmitting, userUpdateFailureOrSuccessOption: $userUpdateFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateUserProfileState &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.workPhotos, workPhotos) ||
                const DeepCollectionEquality()
                    .equals(other.workPhotos, workPhotos)) &&
            (identical(other.skill, skill) ||
                const DeepCollectionEquality().equals(other.skill, skill)) &&
            (identical(other.dialcode, dialcode) ||
                const DeepCollectionEquality()
                    .equals(other.dialcode, dialcode)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.userUpdateFailureOrSuccessOption,
                    userUpdateFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.userUpdateFailureOrSuccessOption,
                    userUpdateFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(workPhotos) ^
      const DeepCollectionEquality().hash(skill) ^
      const DeepCollectionEquality().hash(dialcode) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(userUpdateFailureOrSuccessOption);

  @override
  _$UpdateUserProfileStateCopyWith<_UpdateUserProfileState> get copyWith =>
      __$UpdateUserProfileStateCopyWithImpl<_UpdateUserProfileState>(
          this, _$identity);
}

abstract class _UpdateUserProfileState implements UpdateUserProfileState {
  const factory _UpdateUserProfileState(
      {@required
          String username,
      @required
          String password,
      @required
          String id,
      @required
          String city,
      @required
          String location,
      @required
          String phone,
      @required
          File photo,
      List<Asset> workPhotos,
      String skill,
      @required
          String dialcode,
      @required
          bool isSubmitting,
      @required
          Option<Either<UserUpdateFailure, UpdateUserProfileModelData>>
              userUpdateFailureOrSuccessOption}) = _$_UpdateUserProfileState;

  @override
  String get username;
  @override
  String get password;
  @override
  String get id;
  @override
  String get city;
  @override
  String get location;
  @override
  String get phone;
  @override
  File get photo;
  @override
  List<Asset> get workPhotos;
  @override
  String get skill;
  @override
  String get dialcode;
  @override
  bool get isSubmitting;
  @override
  Option<Either<UserUpdateFailure, UpdateUserProfileModelData>>
      get userUpdateFailureOrSuccessOption;
  @override
  _$UpdateUserProfileStateCopyWith<_UpdateUserProfileState> get copyWith;
}
