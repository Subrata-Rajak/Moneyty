import 'package:firebase_auth/firebase_auth.dart';
import 'package:moneyty/features/auth/domain/repositories/auth_repository.dart';

class LoginUserUsecase {
  final AuthRepository authRepository;

  LoginUserUsecase({required this.authRepository});

  Future<UserCredential?> loginUser({
    required String email,
    required String password,
  }) async {
    return authRepository.loginUser(
      email: email,
      password: password,
    );
  }
}
