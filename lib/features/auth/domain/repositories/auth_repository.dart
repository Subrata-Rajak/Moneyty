import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential?> registerUser({
    required String email,
    required String password,
  });

  Future<UserCredential?> loginUser({
    required String email,
    required String password,
  });
}
