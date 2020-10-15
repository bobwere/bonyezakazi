import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/src/domain/auth/i_auth_inteface.dart';
import 'package:bonyeza_kazi/src/infrastructure/auth/models/login_user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._iAuthFacade) : super(AuthState.uninitialized());

  final IAuthFacade _iAuthFacade;

  void appStarted() async {
    final userOption = _iAuthFacade.getSignedInUser();

    //time for splash screen to animate first then proceed
    await Future.delayed(Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool(ONBOARDING_PAGE_SEEN) ?? false;
    if (!value) {
      emit(AuthState.onboarding());
    } else {
      userOption.fold(() => emit(AuthState.unauthenticated()),
          (user) => emit(AuthState.authenticated(user)));
    }
  }

  void logIn() {
    final userOption = _iAuthFacade.getSignedInUser();
    final user = userOption.getOrElse(() => null);
    user != null
        ? emit(AuthState.authenticated(user))
        : emit(AuthState.unauthenticated());
  }

  void registerClient() {
    emit(AuthState.unregisteredClient());
  }

  void registerSP() {
    emit(AuthState.unregisteredSp());
  }

  void searchFor() {
    emit(AuthState.searchingFor());
  }

  void logOut() async {
    await _iAuthFacade.signOut();
    emit(AuthState.unauthenticated());
  }
}
