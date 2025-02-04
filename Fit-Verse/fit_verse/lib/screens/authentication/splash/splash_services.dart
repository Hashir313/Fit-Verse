// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_verse/screens/authentication/login_screen.dart';
import 'package:fit_verse/screens/bottom_navigation_bar/bottom_navigation_bar_screen.dart';
import 'package:flutter/material.dart';

class SplashServices {
  User? user = FirebaseAuth.instance.currentUser;
  Future<void> isLogin(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigationBarScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        }
      },
    );
  }
}
