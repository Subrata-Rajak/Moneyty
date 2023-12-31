import 'package:firebase_auth/firebase_auth.dart';
import 'package:moneyty/features/auth/data/source/auth_service.dart';
import 'package:moneyty/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl({required this.authService});

  @override
  Future<UserCredential?> loginUser({
    required String email,
    required String password,
  }) async {
    return await authService.loginUser(email: email, password: password);
  }

  @override
  Future<UserCredential?> registerUser({
    required String email,
    required String password,
  }) async {
    return authService.registerUser(
      email: email,
      password: password,
    );
  }
}
