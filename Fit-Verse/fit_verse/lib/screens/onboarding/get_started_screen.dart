import 'package:fit_verse/screens/onboarding/gender_selection.dart';
import 'package:fit_verse/utils/colors.dart';
import 'package:fit_verse/utils/custom_button.dart';
import 'package:fit_verse/utils/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                white,
                primaryColor.withValues(alpha: 0.2),
              ],
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              stops: const [0.6, 1],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/trainer_pic_and_holder.png',
                  height: 0.4.sh,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Hello!',
                style: GoogleFonts.poppins(
                  fontSize: const ResponsiveTextSize()
                      .getResponsiveTextSize(context, 36),
                  fontWeight: FontWeight.w600,
                  color: black,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'I’m your Personal trainer.\nHere are some questions to tailor\n your personalized plan.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: const ResponsiveTextSize()
                      .getResponsiveTextSize(context, 14),
                  fontWeight: FontWeight.w400,
                  color: black,
                ),
              ),
              SizedBox(height: 50.h),
              SizedBox(
                width: 0.4.sw,
                height: 0.05.sh,
                child: CustomButton(
                  buttonText: 'I’m ready',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GenderSelectionScreen(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
