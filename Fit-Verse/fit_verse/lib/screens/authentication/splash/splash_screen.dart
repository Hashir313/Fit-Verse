import 'package:fit_verse/screens/authentication/splash/splash_services.dart';
import 'package:fit_verse/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    _splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Center(
          child: Image.asset(
            'assets/images/fitverse_logo.png',
            width: 1.0.sw,
            height: 1.0.sh,
          ),
        ),
      ),
    );
  }
}
