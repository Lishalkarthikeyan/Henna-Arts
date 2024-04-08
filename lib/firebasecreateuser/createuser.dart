import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  registerUser(String email, String password,) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("User registered successfully");
    } catch (e) {
      print("Error registering user: $e");
      // Handle registration error
    }
  }

  signinUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      print("User Signin Successfully");

      currentUser();
    } catch (e) {
      print("Error while Sign in  : $e");
    }
  }

  currentUser() {
    //   shared
  }
}
