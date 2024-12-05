// ignore_for_file: use_build_context_synchronously

import 'package:fit_verse/screens/authentication/login_screen.dart';
import 'package:flutter/material.dart';

class SplashServices {
  Future<void> isLogin(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
    );
  }
}
