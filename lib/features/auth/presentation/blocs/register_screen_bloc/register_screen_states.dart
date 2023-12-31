import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterScreenStates {}

class RegisterInitialState extends RegisterScreenStates {
  final bool isObscure;

  RegisterInitialState({required this.isObscure});
}

class RegisterPasswordState extends RegisterScreenStates {
  final bool isObscure;

  RegisterPasswordState({required this.isObscure});
}

class RegisteringUserState extends RegisterScreenStates {}

class RegisteringSuccessfulState extends RegisterScreenStates {
  final UserCredential? credential;

  RegisteringSuccessfulState({required this.credential});
}

class RegisteringErrorState extends RegisterScreenStates {
  final String errorMessage;

  RegisteringErrorState({required this.errorMessage});
}
