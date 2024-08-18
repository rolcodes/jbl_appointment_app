import 'package:firebase_auth/firebase_auth.dart';

import '../utils/popups/loaders.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  void exception(String code) {
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: code.toString());
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Something went wrong');
    }
  }

  exceptionHandlerSignUp(String code) {
    switch (code) {
      case "weak-password":
        exception(code);
      case "email-already-in-user":
        exception(code);
      case "invalid-email":
        exception(code);
      case "network-request-failed":
        exception(code);
      default:
        TLoaders.errorSnackBar(title: "Something went wrong!");
    }
  }

  exceptionHandlerSignIn(String code) {
    switch (code) {
      case "user-not-found":
        exception(code);
      case "wrong-password":
        exception(code);
      case "invalid-email":
        exception(code);
      default:
        TLoaders.errorSnackBar(
            title: "Login Failed!",
            message: 'The email or password you entered is incorrect. Please try again.');
    }
  }
}
