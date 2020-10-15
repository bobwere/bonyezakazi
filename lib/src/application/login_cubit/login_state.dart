part of 'login_cubit.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @required String username,
    @required String password,
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required
        Option<Either<AuthFailure, LoginUserModel>> authFailureOrSuccessOption,
  }) = _LoginState;

  factory LoginState.initial() => LoginState(
        username: '',
        password: '',
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
