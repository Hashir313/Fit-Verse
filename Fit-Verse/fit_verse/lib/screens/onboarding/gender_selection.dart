import 'package:fit_verse/screens/onboarding/body_options.dart';
import 'package:fit_verse/utils/colors.dart';
import 'package:fit_verse/utils/responsive_text.dart';
import 'package:fit_verse/widgets/animated_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          toolbarHeight: 0.1.sh,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          centerTitle: false,
          title: SizedBox(
            height: 0.05.sh,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 80,
                  right: 0,
                  bottom: 0,
                  top: 0.5,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '01',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: const ResponsiveTextSize()
                                .getResponsiveTextSize(context, 16),
                          ),
                        ),
                        TextSpan(
                          text: ' Gender',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: const ResponsiveTextSize()
                                .getResponsiveTextSize(context, 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  left: -60,
                  right: 0,
                  child: AnimatedSlider(
                    currentIndex: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                white,
                primaryColor.withValues(alpha: 0.2),
              ],
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              stops: const [0.5, 1],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "What's your gender?",
                style: GoogleFonts.poppins(
                    fontSize: const ResponsiveTextSize().getResponsiveTextSize(
                      context,
                      20,
                    ),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                "Let us know you better",
                style: GoogleFonts.poppins(
                  fontSize: const ResponsiveTextSize().getResponsiveTextSize(
                    context,
                    14,
                  ),
                  color: secondaryColor,
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'female';
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: selectedGender == 'female'
                                  ? primaryColor.withValues(alpha: 0.5)
                                  : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(10.0.r),
                            child: selectedGender == 'female'
                                ? Image.asset(
                                    'assets/images/female.png', // Replace with your female image asset
                                    height: 0.4.sh,
                                  )
                                : Image.asset(
                                    'assets/images/unselected_female.png', // Replace with your female image asset
                                    height: 0.4.sh,
                                  )),
                        Text(
                          'Female',
                          style: GoogleFonts.poppins(
                            fontSize: const ResponsiveTextSize()
                                .getResponsiveTextSize(context, 16),
                            color: selectedGender == 'female'
                                ? primaryColor
                                : secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'male';
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: selectedGender == 'male'
                                ? primaryColor.withValues(alpha: 0.5)
                                : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(10.0.r),
                          child: selectedGender == 'male'
                              ? Image.asset(
                                  'assets/images/male.png', // Replace with your male image asset
                                  height: 0.4.sh,
                                )
                              : Image.asset(
                                  'assets/images/unselected_male.png', // Replace with your male image asset
                                  height: 0.4.sh,
                                ),
                        ),
                        Text(
                          'Male',
                          style: TextStyle(
                            fontSize: const ResponsiveTextSize()
                                .getResponsiveTextSize(context, 16),
                            color: selectedGender == 'male'
                                ? primaryColor
                                : secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100.h),
              GestureDetector(
                onTap: () {
                  if (selectedGender != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BodyOptionsScreen(),
                      ),
                    );
                  }
                },
                child: Container(
                  width: 0.8.sw,
                  height: 0.05.sh,
                  decoration: BoxDecoration(
                    color:
                        selectedGender != null ? primaryColor : secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Next',
                    style: GoogleFonts.poppins(
                      fontSize:
                          const ResponsiveTextSize().getResponsiveTextSize(
                        context,
                        16,
                      ),
                      color: white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
