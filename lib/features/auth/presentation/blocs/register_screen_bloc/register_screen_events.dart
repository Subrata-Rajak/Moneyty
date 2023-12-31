abstract class RegisterScreenEvents {}

class ToggleRegisterPasswordEvent extends RegisterScreenEvents {}

class RegisterUserEvent extends RegisterScreenEvents {
  final String email;
  final String password;

  RegisterUserEvent({
    required this.email,
    required this.password,
  });
}
