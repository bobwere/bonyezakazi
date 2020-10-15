// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'create_message_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CreateMessageStateTearOff {
  const _$CreateMessageStateTearOff();

// ignore: unused_element
  _RegistrationState call(
      {String message,
      File photo,
      bool showErrorMessages,
      bool isSubmittingText,
      bool isSubmittingImage,
      Option<Either<ChatFailure, Unit>> sendingFailureOrSuccessOption}) {
    return _RegistrationState(
      message: message,
      photo: photo,
      showErrorMessages: showErrorMessages,
      isSubmittingText: isSubmittingText,
      isSubmittingImage: isSubmittingImage,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $CreateMessageState = _$CreateMessageStateTearOff();

mixin _$CreateMessageState {
  String get message;
  File get photo;
  bool get showErrorMessages;
  bool get isSubmittingText;
  bool get isSubmittingImage;
  Option<Either<ChatFailure, Unit>> get sendingFailureOrSuccessOption;

  $CreateMessageStateCopyWith<CreateMessageState> get copyWith;
}

abstract class $CreateMessageStateCopyWith<$Res> {
  factory $CreateMessageStateCopyWith(
          CreateMessageState value, $Res Function(CreateMessageState) then) =
      _$CreateMessageStateCopyWithImpl<$Res>;
  $Res call(
      {String message,
      File photo,
      bool showErrorMessages,
      bool isSubmittingText,
      bool isSubmittingImage,
      Option<Either<ChatFailure, Unit>> sendingFailureOrSuccessOption});
}

class _$CreateMessageStateCopyWithImpl<$Res>
    implements $CreateMessageStateCopyWith<$Res> {
  _$CreateMessageStateCopyWithImpl(this._value, this._then);

  final CreateMessageState _value;
  // ignore: unused_field
  final $Res Function(CreateMessageState) _then;

  @override
  $Res call({
    Object message = freezed,
    Object photo = freezed,
    Object showErrorMessages = freezed,
    Object isSubmittingText = freezed,
    Object isSubmittingImage = freezed,
    Object sendingFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed ? _value.message : message as String,
      photo: photo == freezed ? _value.photo : photo as File,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmittingText: isSubmittingText == freezed
          ? _value.isSubmittingText
          : isSubmittingText as bool,
      isSubmittingImage: isSubmittingImage == freezed
          ? _value.isSubmittingImage
          : isSubmittingImage as bool,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption == freezed
          ? _value.sendingFailureOrSuccessOption
          : sendingFailureOrSuccessOption as Option<Either<ChatFailure, Unit>>,
    ));
  }
}

abstract class _$RegistrationStateCopyWith<$Res>
    implements $CreateMessageStateCopyWith<$Res> {
  factory _$RegistrationStateCopyWith(
          _RegistrationState value, $Res Function(_RegistrationState) then) =
      __$RegistrationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String message,
      File photo,
      bool showErrorMessages,
      bool isSubmittingText,
      bool isSubmittingImage,
      Option<Either<ChatFailure, Unit>> sendingFailureOrSuccessOption});
}

class __$RegistrationStateCopyWithImpl<$Res>
    extends _$CreateMessageStateCopyWithImpl<$Res>
    implements _$RegistrationStateCopyWith<$Res> {
  __$RegistrationStateCopyWithImpl(
      _RegistrationState _value, $Res Function(_RegistrationState) _then)
      : super(_value, (v) => _then(v as _RegistrationState));

  @override
  _RegistrationState get _value => super._value as _RegistrationState;

  @override
  $Res call({
    Object message = freezed,
    Object photo = freezed,
    Object showErrorMessages = freezed,
    Object isSubmittingText = freezed,
    Object isSubmittingImage = freezed,
    Object sendingFailureOrSuccessOption = freezed,
  }) {
    return _then(_RegistrationState(
      message: message == freezed ? _value.message : message as String,
      photo: photo == freezed ? _value.photo : photo as File,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmittingText: isSubmittingText == freezed
          ? _value.isSubmittingText
          : isSubmittingText as bool,
      isSubmittingImage: isSubmittingImage == freezed
          ? _value.isSubmittingImage
          : isSubmittingImage as bool,
      sendingFailureOrSuccessOption: sendingFailureOrSuccessOption == freezed
          ? _value.sendingFailureOrSuccessOption
          : sendingFailureOrSuccessOption as Option<Either<ChatFailure, Unit>>,
    ));
  }
}

class _$_RegistrationState implements _RegistrationState {
  const _$_RegistrationState(
      {this.message,
      this.photo,
      this.showErrorMessages,
      this.isSubmittingText,
      this.isSubmittingImage,
      this.sendingFailureOrSuccessOption});

  @override
  final String message;
  @override
  final File photo;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmittingText;
  @override
  final bool isSubmittingImage;
  @override
  final Option<Either<ChatFailure, Unit>> sendingFailureOrSuccessOption;

  @override
  String toString() {
    return 'CreateMessageState(message: $message, photo: $photo, showErrorMessages: $showErrorMessages, isSubmittingText: $isSubmittingText, isSubmittingImage: $isSubmittingImage, sendingFailureOrSuccessOption: $sendingFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegistrationState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSubmittingText, isSubmittingText) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmittingText, isSubmittingText)) &&
            (identical(other.isSubmittingImage, isSubmittingImage) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmittingImage, isSubmittingImage)) &&
            (identical(other.sendingFailureOrSuccessOption,
                    sendingFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.sendingFailureOrSuccessOption,
                    sendingFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmittingText) ^
      const DeepCollectionEquality().hash(isSubmittingImage) ^
      const DeepCollectionEquality().hash(sendingFailureOrSuccessOption);

  @override
  _$RegistrationStateCopyWith<_RegistrationState> get copyWith =>
      __$RegistrationStateCopyWithImpl<_RegistrationState>(this, _$identity);
}

abstract class _RegistrationState implements CreateMessageState {
  const factory _RegistrationState(
          {String message,
          File photo,
          bool showErrorMessages,
          bool isSubmittingText,
          bool isSubmittingImage,
          Option<Either<ChatFailure, Unit>> sendingFailureOrSuccessOption}) =
      _$_RegistrationState;

  @override
  String get message;
  @override
  File get photo;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmittingText;
  @override
  bool get isSubmittingImage;
  @override
  Option<Either<ChatFailure, Unit>> get sendingFailureOrSuccessOption;
  @override
  _$RegistrationStateCopyWith<_RegistrationState> get copyWith;
}
