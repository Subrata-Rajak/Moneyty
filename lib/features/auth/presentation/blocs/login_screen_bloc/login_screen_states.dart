import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginScreenStates {}

class LoginInitialState extends LoginScreenStates {
  final bool isObscure;

  LoginInitialState({required this.isObscure});
}

class LoginPasswordState extends LoginScreenStates {
  final bool isObscure;

  LoginPasswordState({required this.isObscure});
}

class LoggingUserInState extends LoginScreenStates {}

class LoggingUserInSuccessfulState extends LoginScreenStates {
  final UserCredential? credential;

  LoggingUserInSuccessfulState({required this.credential});
}

class LoggingUserInFailedState extends LoginScreenStates {
  final String errorMessage;

  LoggingUserInFailedState({required this.errorMessage});
}
