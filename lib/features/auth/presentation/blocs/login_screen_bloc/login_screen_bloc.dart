import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyty/features/auth/domain/usecases/login_user_usecase.dart';
import 'package:moneyty/features/auth/presentation/blocs/login_screen_bloc/login_screen_events.dart';
import 'package:moneyty/features/auth/presentation/blocs/login_screen_bloc/login_screen_states.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvents, LoginScreenStates> {
  final LoginUserUsecase loginUserUsecase;
  LoginScreenBloc({
    required this.loginUserUsecase,
  }) : super(LoginInitialState(isObscure: true)) {
    on<ToggleLoginPasswordEvent>(toggleLoginPassword);
    on<LoginUserInEvent>(logUserIn);
  }

  FutureOr<void> toggleLoginPassword(
    ToggleLoginPasswordEvent event,
    Emitter<LoginScreenStates> emit,
  ) {
    if (state is LoginInitialState) {
      emit(LoginPasswordState(isObscure: false));
    } else {
      final currentState = state as LoginPasswordState;
      emit(LoginPasswordState(isObscure: !currentState.isObscure));
    }
  }

  FutureOr<void> logUserIn(
    LoginUserInEvent event,
    Emitter<LoginScreenStates> emit,
  ) async {
    emit(LoggingUserInState());

    final String email = event.email;
    final String password = event.password;

    try {
      final credential = await loginUserUsecase.loginUser(
        email: email,
        password: password,
      );

      if (credential != null) {
        emit(LoggingUserInSuccessfulState(credential: credential));
      } else {
        emit(LoggingUserInFailedState(errorMessage: 'Failed to Log user in'));
      }
    } catch (e) {
      emit(LoggingUserInFailedState(errorMessage: 'Failed to log user in'));
      print("Error while logging user in -- BLOC: $e");
    }
  }
}
