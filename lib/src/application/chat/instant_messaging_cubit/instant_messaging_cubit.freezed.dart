// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'instant_messaging_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$InstantMessagingStateTearOff {
  const _$InstantMessagingStateTearOff();

// ignore: unused_element
  Initial initial() {
    return const Initial();
  }

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  Success success(
      KtList<Message> allMessages, String currentUserID, String userTypeID) {
    return Success(
      allMessages,
      currentUserID,
      userTypeID,
    );
  }

// ignore: unused_element
  Failure failure(ChatFailure failure) {
    return Failure(
      failure,
    );
  }
}

// ignore: unused_element
const $InstantMessagingState = _$InstantMessagingStateTearOff();

mixin _$InstantMessagingState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required
        Result success(KtList<Message> allMessages, String currentUserID,
            String userTypeID),
    @required Result failure(ChatFailure failure),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(
        KtList<Message> allMessages, String currentUserID, String userTypeID),
    Result failure(ChatFailure failure),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result failure(Failure value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result success(Success value),
    Result failure(Failure value),
    @required Result orElse(),
  });
}

abstract class $InstantMessagingStateCopyWith<$Res> {
  factory $InstantMessagingStateCopyWith(InstantMessagingState value,
          $Res Function(InstantMessagingState) then) =
      _$InstantMessagingStateCopyWithImpl<$Res>;
}

class _$InstantMessagingStateCopyWithImpl<$Res>
    implements $InstantMessagingStateCopyWith<$Res> {
  _$InstantMessagingStateCopyWithImpl(this._value, this._then);

  final InstantMessagingState _value;
  // ignore: unused_field
  final $Res Function(InstantMessagingState) _then;
}

abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

class _$InitialCopyWithImpl<$Res>
    extends _$InstantMessagingStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'InstantMessagingState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required
        Result success(KtList<Message> allMessages, String currentUserID,
            String userTypeID),
    @required Result failure(ChatFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(
        KtList<Message> allMessages, String currentUserID, String userTypeID),
    Result failure(ChatFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result failure(Failure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result success(Success value),
    Result failure(Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements InstantMessagingState {
  const factory Initial() = _$Initial;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res>
    extends _$InstantMessagingStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'InstantMessagingState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required
        Result success(KtList<Message> allMessages, String currentUserID,
            String userTypeID),
    @required Result failure(ChatFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(
        KtList<Message> allMessages, String currentUserID, String userTypeID),
    Result failure(ChatFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result failure(Failure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result success(Success value),
    Result failure(Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements InstantMessagingState {
  const factory Loading() = _$Loading;
}

abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  $Res call(
      {KtList<Message> allMessages, String currentUserID, String userTypeID});
}

class _$SuccessCopyWithImpl<$Res>
    extends _$InstantMessagingStateCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;

  @override
  $Res call({
    Object allMessages = freezed,
    Object currentUserID = freezed,
    Object userTypeID = freezed,
  }) {
    return _then(Success(
      allMessages == freezed
          ? _value.allMessages
          : allMessages as KtList<Message>,
      currentUserID == freezed ? _value.currentUserID : currentUserID as String,
      userTypeID == freezed ? _value.userTypeID : userTypeID as String,
    ));
  }
}

class _$Success implements Success {
  const _$Success(this.allMessages, this.currentUserID, this.userTypeID)
      : assert(allMessages != null),
        assert(currentUserID != null),
        assert(userTypeID != null);

  @override
  final KtList<Message> allMessages;
  @override
  final String currentUserID;
  @override
  final String userTypeID;

  @override
  String toString() {
    return 'InstantMessagingState.success(allMessages: $allMessages, currentUserID: $currentUserID, userTypeID: $userTypeID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.allMessages, allMessages) ||
                const DeepCollectionEquality()
                    .equals(other.allMessages, allMessages)) &&
            (identical(other.currentUserID, currentUserID) ||
                const DeepCollectionEquality()
                    .equals(other.currentUserID, currentUserID)) &&
            (identical(other.userTypeID, userTypeID) ||
                const DeepCollectionEquality()
                    .equals(other.userTypeID, userTypeID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(allMessages) ^
      const DeepCollectionEquality().hash(currentUserID) ^
      const DeepCollectionEquality().hash(userTypeID);

  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required
        Result success(KtList<Message> allMessages, String currentUserID,
            String userTypeID),
    @required Result failure(ChatFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return success(allMessages, currentUserID, userTypeID);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(
        KtList<Message> allMessages, String currentUserID, String userTypeID),
    Result failure(ChatFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(allMessages, currentUserID, userTypeID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result failure(Failure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result success(Success value),
    Result failure(Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements InstantMessagingState {
  const factory Success(KtList<Message> allMessages, String currentUserID,
      String userTypeID) = _$Success;

  KtList<Message> get allMessages;
  String get currentUserID;
  String get userTypeID;
  $SuccessCopyWith<Success> get copyWith;
}

abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
  $Res call({ChatFailure failure});

  $ChatFailureCopyWith<$Res> get failure;
}

class _$FailureCopyWithImpl<$Res>
    extends _$InstantMessagingStateCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(Failure _value, $Res Function(Failure) _then)
      : super(_value, (v) => _then(v as Failure));

  @override
  Failure get _value => super._value as Failure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(Failure(
      failure == freezed ? _value.failure : failure as ChatFailure,
    ));
  }

  @override
  $ChatFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $ChatFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

class _$Failure implements Failure {
  const _$Failure(this.failure) : assert(failure != null);

  @override
  final ChatFailure failure;

  @override
  String toString() {
    return 'InstantMessagingState.failure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Failure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $FailureCopyWith<Failure> get copyWith =>
      _$FailureCopyWithImpl<Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required
        Result success(KtList<Message> allMessages, String currentUserID,
            String userTypeID),
    @required Result failure(ChatFailure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result success(
        KtList<Message> allMessages, String currentUserID, String userTypeID),
    Result failure(ChatFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result failure(Failure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result loading(Loading value),
    Result success(Success value),
    Result failure(Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements InstantMessagingState {
  const factory Failure(ChatFailure failure) = _$Failure;

  ChatFailure get failure;
  $FailureCopyWith<Failure> get copyWith;
}
