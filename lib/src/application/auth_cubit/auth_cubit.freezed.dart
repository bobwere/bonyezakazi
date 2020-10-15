// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthStateTearOff {
  const _$AuthStateTearOff();

// ignore: unused_element
  Uninitialized uninitialized() {
    return const Uninitialized();
  }

// ignore: unused_element
  Authenticated authenticated(LoginUserModel user) {
    return Authenticated(
      user,
    );
  }

// ignore: unused_element
  UnAuthenticated unauthenticated() {
    return const UnAuthenticated();
  }

// ignore: unused_element
  Onboarding onboarding() {
    return const Onboarding();
  }

// ignore: unused_element
  SearchingFor searchingFor() {
    return const SearchingFor();
  }

// ignore: unused_element
  UnregisteredClient unregisteredClient() {
    return const UnregisteredClient();
  }

// ignore: unused_element
  UnregisteredSp unregisteredSp() {
    return const UnregisteredSp();
  }
}

// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

mixin _$AuthState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required Result authenticated(LoginUserModel user),
    @required Result unauthenticated(),
    @required Result onboarding(),
    @required Result searchingFor(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user),
    Result unauthenticated(),
    Result onboarding(),
    Result searchingFor(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    @required Result orElse(),
  });
}

abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

abstract class $UninitializedCopyWith<$Res> {
  factory $UninitializedCopyWith(
          Uninitialized value, $Res Function(Uninitialized) then) =
      _$UninitializedCopyWithImpl<$Res>;
}

class _$UninitializedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $UninitializedCopyWith<$Res> {
  _$UninitializedCopyWithImpl(
      Uninitialized _value, $Res Function(Uninitialized) _then)
      : super(_value, (v) => _then(v as Uninitialized));

  @override
  Uninitialized get _value => super._value as Uninitialized;
}

class _$Uninitialized implements Uninitialized {
  const _$Uninitialized();

  @override
  String toString() {
    return 'AuthState.uninitialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Uninitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required Result authenticated(LoginUserModel user),
    @required Result unauthenticated(),
    @required Result onboarding(),
    @required Result searchingFor(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    return uninitialized();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user),
    Result unauthenticated(),
    Result onboarding(),
    Result searchingFor(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (uninitialized != null) {
      return uninitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    return uninitialized(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (uninitialized != null) {
      return uninitialized(this);
    }
    return orElse();
  }
}

abstract class Uninitialized implements AuthState {
  const factory Uninitialized() = _$Uninitialized;
}

abstract class $AuthenticatedCopyWith<$Res> {
  factory $AuthenticatedCopyWith(
          Authenticated value, $Res Function(Authenticated) then) =
      _$AuthenticatedCopyWithImpl<$Res>;
  $Res call({LoginUserModel user});
}

class _$AuthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(
      Authenticated _value, $Res Function(Authenticated) _then)
      : super(_value, (v) => _then(v as Authenticated));

  @override
  Authenticated get _value => super._value as Authenticated;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(Authenticated(
      user == freezed ? _value.user : user as LoginUserModel,
    ));
  }
}

class _$Authenticated implements Authenticated {
  const _$Authenticated(this.user) : assert(user != null);

  @override
  final LoginUserModel user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Authenticated &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @override
  $AuthenticatedCopyWith<Authenticated> get copyWith =>
      _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required Result authenticated(LoginUserModel user),
    @required Result unauthenticated(),
    @required Result onboarding(),
    @required Result searchingFor(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user),
    Result unauthenticated(),
    Result onboarding(),
    Result searchingFor(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthState {
  const factory Authenticated(LoginUserModel user) = _$Authenticated;

  LoginUserModel get user;
  $AuthenticatedCopyWith<Authenticated> get copyWith;
}

abstract class $UnAuthenticatedCopyWith<$Res> {
  factory $UnAuthenticatedCopyWith(
          UnAuthenticated value, $Res Function(UnAuthenticated) then) =
      _$UnAuthenticatedCopyWithImpl<$Res>;
}

class _$UnAuthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $UnAuthenticatedCopyWith<$Res> {
  _$UnAuthenticatedCopyWithImpl(
      UnAuthenticated _value, $Res Function(UnAuthenticated) _then)
      : super(_value, (v) => _then(v as UnAuthenticated));

  @override
  UnAuthenticated get _value => super._value as UnAuthenticated;
}

class _$UnAuthenticated implements UnAuthenticated {
  const _$UnAuthenticated();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required Result authenticated(LoginUserModel user),
    @required Result unauthenticated(),
    @required Result onboarding(),
    @required Result searchingFor(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user),
    Result unauthenticated(),
    Result onboarding(),
    Result searchingFor(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class UnAuthenticated implements AuthState {
  const factory UnAuthenticated() = _$UnAuthenticated;
}

abstract class $OnboardingCopyWith<$Res> {
  factory $OnboardingCopyWith(
          Onboarding value, $Res Function(Onboarding) then) =
      _$OnboardingCopyWithImpl<$Res>;
}

class _$OnboardingCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $OnboardingCopyWith<$Res> {
  _$OnboardingCopyWithImpl(Onboarding _value, $Res Function(Onboarding) _then)
      : super(_value, (v) => _then(v as Onboarding));

  @override
  Onboarding get _value => super._value as Onboarding;
}

class _$Onboarding implements Onboarding {
  const _$Onboarding();

  @override
  String toString() {
    return 'AuthState.onboarding()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Onboarding);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required Result authenticated(LoginUserModel user),
    @required Result unauthenticated(),
    @required Result onboarding(),
    @required Result searchingFor(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    return onboarding();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user),
    Result unauthenticated(),
    Result onboarding(),
    Result searchingFor(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onboarding != null) {
      return onboarding();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    return onboarding(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (onboarding != null) {
      return onboarding(this);
    }
    return orElse();
  }
}

abstract class Onboarding implements AuthState {
  const factory Onboarding() = _$Onboarding;
}

abstract class $SearchingForCopyWith<$Res> {
  factory $SearchingForCopyWith(
          SearchingFor value, $Res Function(SearchingFor) then) =
      _$SearchingForCopyWithImpl<$Res>;
}

class _$SearchingForCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $SearchingForCopyWith<$Res> {
  _$SearchingForCopyWithImpl(
      SearchingFor _value, $Res Function(SearchingFor) _then)
      : super(_value, (v) => _then(v as SearchingFor));

  @override
  SearchingFor get _value => super._value as SearchingFor;
}

class _$SearchingFor implements SearchingFor {
  const _$SearchingFor();

  @override
  String toString() {
    return 'AuthState.searchingFor()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SearchingFor);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required Result authenticated(LoginUserModel user),
    @required Result unauthenticated(),
    @required Result onboarding(),
    @required Result searchingFor(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    return searchingFor();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user),
    Result unauthenticated(),
    Result onboarding(),
    Result searchingFor(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (searchingFor != null) {
      return searchingFor();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    return searchingFor(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (searchingFor != null) {
      return searchingFor(this);
    }
    return orElse();
  }
}

abstract class SearchingFor implements AuthState {
  const factory SearchingFor() = _$SearchingFor;
}

abstract class $UnregisteredClientCopyWith<$Res> {
  factory $UnregisteredClientCopyWith(
          UnregisteredClient value, $Res Function(UnregisteredClient) then) =
      _$UnregisteredClientCopyWithImpl<$Res>;
}

class _$UnregisteredClientCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $UnregisteredClientCopyWith<$Res> {
  _$UnregisteredClientCopyWithImpl(
      UnregisteredClient _value, $Res Function(UnregisteredClient) _then)
      : super(_value, (v) => _then(v as UnregisteredClient));

  @override
  UnregisteredClient get _value => super._value as UnregisteredClient;
}

class _$UnregisteredClient implements UnregisteredClient {
  const _$UnregisteredClient();

  @override
  String toString() {
    return 'AuthState.unregisteredClient()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnregisteredClient);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required Result authenticated(LoginUserModel user),
    @required Result unauthenticated(),
    @required Result onboarding(),
    @required Result searchingFor(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    return unregisteredClient();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user),
    Result unauthenticated(),
    Result onboarding(),
    Result searchingFor(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unregisteredClient != null) {
      return unregisteredClient();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    return unregisteredClient(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unregisteredClient != null) {
      return unregisteredClient(this);
    }
    return orElse();
  }
}

abstract class UnregisteredClient implements AuthState {
  const factory UnregisteredClient() = _$UnregisteredClient;
}

abstract class $UnregisteredSpCopyWith<$Res> {
  factory $UnregisteredSpCopyWith(
          UnregisteredSp value, $Res Function(UnregisteredSp) then) =
      _$UnregisteredSpCopyWithImpl<$Res>;
}

class _$UnregisteredSpCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $UnregisteredSpCopyWith<$Res> {
  _$UnregisteredSpCopyWithImpl(
      UnregisteredSp _value, $Res Function(UnregisteredSp) _then)
      : super(_value, (v) => _then(v as UnregisteredSp));

  @override
  UnregisteredSp get _value => super._value as UnregisteredSp;
}

class _$UnregisteredSp implements UnregisteredSp {
  const _$UnregisteredSp();

  @override
  String toString() {
    return 'AuthState.unregisteredSp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnregisteredSp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result uninitialized(),
    @required Result authenticated(LoginUserModel user),
    @required Result unauthenticated(),
    @required Result onboarding(),
    @required Result searchingFor(),
    @required Result unregisteredClient(),
    @required Result unregisteredSp(),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    return unregisteredSp();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result uninitialized(),
    Result authenticated(LoginUserModel user),
    Result unauthenticated(),
    Result onboarding(),
    Result searchingFor(),
    Result unregisteredClient(),
    Result unregisteredSp(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unregisteredSp != null) {
      return unregisteredSp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result uninitialized(Uninitialized value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(UnAuthenticated value),
    @required Result onboarding(Onboarding value),
    @required Result searchingFor(SearchingFor value),
    @required Result unregisteredClient(UnregisteredClient value),
    @required Result unregisteredSp(UnregisteredSp value),
  }) {
    assert(uninitialized != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(onboarding != null);
    assert(searchingFor != null);
    assert(unregisteredClient != null);
    assert(unregisteredSp != null);
    return unregisteredSp(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result uninitialized(Uninitialized value),
    Result authenticated(Authenticated value),
    Result unauthenticated(UnAuthenticated value),
    Result onboarding(Onboarding value),
    Result searchingFor(SearchingFor value),
    Result unregisteredClient(UnregisteredClient value),
    Result unregisteredSp(UnregisteredSp value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unregisteredSp != null) {
      return unregisteredSp(this);
    }
    return orElse();
  }
}

abstract class UnregisteredSp implements AuthState {
  const factory UnregisteredSp() = _$UnregisteredSp;
}
