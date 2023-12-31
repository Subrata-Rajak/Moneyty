import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<UserCredential?> registerUser({
    required String email,
    required String password,
  }) async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(credential.user!.email);
      print(credential.user!.emailVerified);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password is too weak');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for this email');
      }
    } catch (e) {
      print("Error while registering user -- SERVICE: $e");
    }

    return credential;
  }

  Future<UserCredential?> loginUser({
    required String email,
    required String password,
  }) async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(credential.user!.email);
      print(credential.user!.emailVerified);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for this email');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for this user');
      }
    } catch (e) {
      print("Error while logging user in -- SERVICE: $e");
    }

    return credential;
  }
}
