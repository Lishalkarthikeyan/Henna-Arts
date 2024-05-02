
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mehandhi/snackbar.dart';

class

Authentication {
  registerUser(BuildContext context, String email, String password,) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("User Registered sucessfully}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("User Registered Sucessfully", style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 5),
        closeIconColor: Colors.white,));

      return true;
    } catch (e) {
      print("Error registering user: $e");
      showSnackBar(
        context, "Error Registering user", duration: Duration(seconds: 2),);

      return false;


      // Handle registration error
    }
  }


  signinUser(BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("User signed in successfully");

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Sign in Successfully",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 5),
        closeIconColor: Colors.white,
      ));

      return true;
    }
    on FirebaseAuthException catch (e) {
      print("Error while signing in: $e");
      showSnackBar(
        context, "Error while Signing in", duration: Duration(seconds: 2),);

      if (e.code == 'user-not-found') {
        print("User not registered. Please register first.");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "User not registered. Please register first.",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
          closeIconColor: Colors.white,
        ));
      } else if (e.code == 'wrong-password') {
        print("Invalid password. Please try again.");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Invalid password. Please try again.",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
          closeIconColor: Colors.white,
        ));
      }
     //else {
      //   showSnackBar(context, "Error while signing in",
      //       duration: Duration(seconds: 2));
      // }

      return false;
    }
  }

  // Get the currently signed-in user
  currentUser() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      print("Current user: ${user.email}");
    } else {
      print("No user is currently signed in");
    }
  }
}

