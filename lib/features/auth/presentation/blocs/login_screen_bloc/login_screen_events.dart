abstract class LoginScreenEvents {}

class ToggleLoginPasswordEvent extends LoginScreenEvents {}

class LoginUserInEvent extends LoginScreenEvents {
  final String email;
  final String password;

  LoginUserInEvent({
    required this.email,
    required this.password,
  });
}
