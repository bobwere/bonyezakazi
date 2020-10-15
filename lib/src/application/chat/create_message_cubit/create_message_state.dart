part of 'create_message_cubit.dart';

@freezed
abstract class CreateMessageState with _$CreateMessageState {
  const factory CreateMessageState({
    String message,
    File photo,
    bool showErrorMessages,
    bool isSubmittingText,
    bool isSubmittingImage,
    Option<Either<ChatFailure, Unit>> sendingFailureOrSuccessOption,
  }) = _RegistrationState;

  factory CreateMessageState.initial() => CreateMessageState(
        message: '',
        photo: File(''),
        showErrorMessages: false,
        isSubmittingText: false,
        isSubmittingImage: false,
        sendingFailureOrSuccessOption: none(),
      );
}
