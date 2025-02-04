import 'package:fit_verse/utils/responsive_text.dart';
import 'package:fit_verse/widgets/animated_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyOptionsScreen extends StatefulWidget {
  const BodyOptionsScreen({super.key});

  @override
  State<BodyOptionsScreen> createState() => _BodyOptionsScreenState();
}

class _BodyOptionsScreenState extends State<BodyOptionsScreen> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
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
          body: Container()),
    );
  }
}
