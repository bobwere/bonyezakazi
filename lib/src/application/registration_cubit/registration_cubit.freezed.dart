// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'registration_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RegistrationStateTearOff {
  const _$RegistrationStateTearOff();

// ignore: unused_element
  _RegistrationState call(
      {@required
          String username,
      @required
          String password,
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
          Option<Either<AuthFailure, RegistrationUserModel>>
              authFailureOrSuccessOption}) {
    return _RegistrationState(
      username: username,
      password: password,
      city: city,
      location: location,
      phone: phone,
      photo: photo,
      workPhotos: workPhotos,
      skill: skill,
      dialcode: dialcode,
      isSubmitting: isSubmitting,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $RegistrationState = _$RegistrationStateTearOff();

mixin _$RegistrationState {
  String get username;
  String get password;
  String get city;
  String get location;
  String get phone;
  File get photo;
  List<Asset> get workPhotos;
  String get skill;
  String get dialcode;
  bool get isSubmitting;
  Option<Either<AuthFailure, RegistrationUserModel>>
      get authFailureOrSuccessOption;

  $RegistrationStateCopyWith<RegistrationState> get copyWith;
}

abstract class $RegistrationStateCopyWith<$Res> {
  factory $RegistrationStateCopyWith(
          RegistrationState value, $Res Function(RegistrationState) then) =
      _$RegistrationStateCopyWithImpl<$Res>;
  $Res call(
      {String username,
      String password,
      String city,
      String location,
      String phone,
      File photo,
      List<Asset> workPhotos,
      String skill,
      String dialcode,
      bool isSubmitting,
      Option<Either<AuthFailure, RegistrationUserModel>>
          authFailureOrSuccessOption});
}

class _$RegistrationStateCopyWithImpl<$Res>
    implements $RegistrationStateCopyWith<$Res> {
  _$RegistrationStateCopyWithImpl(this._value, this._then);

  final RegistrationState _value;
  // ignore: unused_field
  final $Res Function(RegistrationState) _then;

  @override
  $Res call({
    Object username = freezed,
    Object password = freezed,
    Object city = freezed,
    Object location = freezed,
    Object phone = freezed,
    Object photo = freezed,
    Object workPhotos = freezed,
    Object skill = freezed,
    Object dialcode = freezed,
    Object isSubmitting = freezed,
    Object authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed ? _value.username : username as String,
      password: password == freezed ? _value.password : password as String,
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
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption
              as Option<Either<AuthFailure, RegistrationUserModel>>,
    ));
  }
}

abstract class _$RegistrationStateCopyWith<$Res>
    implements $RegistrationStateCopyWith<$Res> {
  factory _$RegistrationStateCopyWith(
          _RegistrationState value, $Res Function(_RegistrationState) then) =
      __$RegistrationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String username,
      String password,
      String city,
      String location,
      String phone,
      File photo,
      List<Asset> workPhotos,
      String skill,
      String dialcode,
      bool isSubmitting,
      Option<Either<AuthFailure, RegistrationUserModel>>
          authFailureOrSuccessOption});
}

class __$RegistrationStateCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res>
    implements _$RegistrationStateCopyWith<$Res> {
  __$RegistrationStateCopyWithImpl(
      _RegistrationState _value, $Res Function(_RegistrationState) _then)
      : super(_value, (v) => _then(v as _RegistrationState));

  @override
  _RegistrationState get _value => super._value as _RegistrationState;

  @override
  $Res call({
    Object username = freezed,
    Object password = freezed,
    Object city = freezed,
    Object location = freezed,
    Object phone = freezed,
    Object photo = freezed,
    Object workPhotos = freezed,
    Object skill = freezed,
    Object dialcode = freezed,
    Object isSubmitting = freezed,
    Object authFailureOrSuccessOption = freezed,
  }) {
    return _then(_RegistrationState(
      username: username == freezed ? _value.username : username as String,
      password: password == freezed ? _value.password : password as String,
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
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption
              as Option<Either<AuthFailure, RegistrationUserModel>>,
    ));
  }
}

class _$_RegistrationState implements _RegistrationState {
  const _$_RegistrationState(
      {@required this.username,
      @required this.password,
      @required this.city,
      @required this.location,
      @required this.phone,
      @required this.photo,
      this.workPhotos,
      this.skill,
      @required this.dialcode,
      @required this.isSubmitting,
      @required this.authFailureOrSuccessOption})
      : assert(username != null),
        assert(password != null),
        assert(city != null),
        assert(location != null),
        assert(phone != null),
        assert(photo != null),
        assert(dialcode != null),
        assert(isSubmitting != null),
        assert(authFailureOrSuccessOption != null);

  @override
  final String username;
  @override
  final String password;
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
  final Option<Either<AuthFailure, RegistrationUserModel>>
      authFailureOrSuccessOption;

  @override
  String toString() {
    return 'RegistrationState(username: $username, password: $password, city: $city, location: $location, phone: $phone, photo: $photo, workPhotos: $workPhotos, skill: $skill, dialcode: $dialcode, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegistrationState &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
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
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(workPhotos) ^
      const DeepCollectionEquality().hash(skill) ^
      const DeepCollectionEquality().hash(dialcode) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption);

  @override
  _$RegistrationStateCopyWith<_RegistrationState> get copyWith =>
      __$RegistrationStateCopyWithImpl<_RegistrationState>(this, _$identity);
}

abstract class _RegistrationState implements RegistrationState {
  const factory _RegistrationState(
      {@required
          String username,
      @required
          String password,
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
          Option<Either<AuthFailure, RegistrationUserModel>>
              authFailureOrSuccessOption}) = _$_RegistrationState;

  @override
  String get username;
  @override
  String get password;
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
  Option<Either<AuthFailure, RegistrationUserModel>>
      get authFailureOrSuccessOption;
  @override
  _$RegistrationStateCopyWith<_RegistrationState> get copyWith;
}
