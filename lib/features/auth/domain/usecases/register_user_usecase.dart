import 'package:firebase_auth/firebase_auth.dart';
import 'package:moneyty/features/auth/domain/repositories/auth_repository.dart';

class RegisterUserUsecase {
  final AuthRepository authRepository;

  RegisterUserUsecase({required this.authRepository});

  Future<UserCredential?> registerUser({
    required String email,
    required String password,
  }) async {
    return authRepository.registerUser(
      email: email,
      password: password,
    );
  }
}
