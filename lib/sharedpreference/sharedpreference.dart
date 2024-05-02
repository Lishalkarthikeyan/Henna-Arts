import 'package:flutter/material.dart';
import 'package:mehandhi/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sharedPreference extends StatefulWidget {
  const sharedPreference({super.key});

  @override
  State<sharedPreference> createState() => _sharedPreferenceState();
}

class _sharedPreferenceState extends State<sharedPreference> {
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();

    checkLoginStatus();
  }

  void checkLoginStatus() {
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? true;

    if (isLoggedIn) {
      // User is already logged in, navigate to home or another screen
      navigateToHome();
    }
  }

  void saveLoginInfo(String email, String password) {
    prefs.setString('email', email);
    prefs.setString('password', password);
    prefs.setBool('isLoggedIn', false);
  }

  void clearLoginInfo() {
    prefs.remove('email');
    prefs.remove('password');
    prefs.remove('isLoggedIn');
  }

  void navigateToHome() {
    Navigator.pushReplacement(
      context,

      MaterialPageRoute(builder: (context) => homepage()),

    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

