import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyty/features/auth/domain/usecases/register_user_usecase.dart';
import 'package:moneyty/features/auth/presentation/blocs/register_screen_bloc/register_screen_events.dart';
import 'package:moneyty/features/auth/presentation/blocs/register_screen_bloc/register_screen_states.dart';

class RegisterScreenBloc
    extends Bloc<RegisterScreenEvents, RegisterScreenStates> {
  final RegisterUserUsecase registerUserUsecase;
  RegisterScreenBloc({
    required this.registerUserUsecase,
  }) : super(RegisterInitialState(isObscure: true)) {
    on<ToggleRegisterPasswordEvent>(toggleRegisterPassword);
    on<RegisterUserEvent>(registerUser);
  }

  FutureOr<void> toggleRegisterPassword(
    ToggleRegisterPasswordEvent event,
    Emitter<RegisterScreenStates> emit,
  ) {
    if (state is RegisterInitialState) {
      emit(RegisterPasswordState(isObscure: false));
    } else {
      final currentState = state as RegisterPasswordState;
      emit(RegisterPasswordState(isObscure: !currentState.isObscure));
    }
  }

  FutureOr<void> registerUser(
    RegisterUserEvent event,
    Emitter<RegisterScreenStates> emit,
  ) async {
    emit(RegisteringUserState());

    final String email = event.email;
    final String password = event.password;

    try {
      final credential = await registerUserUsecase.registerUser(
        email: email,
        password: password,
      );

      if (credential != null) {
        emit(RegisteringSuccessfulState(credential: credential));
      } else {
        emit(RegisteringErrorState(errorMessage: 'Failed to register user'));
      }
    } catch (e) {
      emit(RegisteringErrorState(errorMessage: 'Failed to register user'));
      print("Error while registering user -- BLOC: $e");
    }
  }
}
