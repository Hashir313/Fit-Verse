import 'package:fit_verse/screens/bottom_navigation_bar/home/exercise_tab_bar/beginner_exercise/chest_exercise_screen.dart';
import 'package:fit_verse/screens/bottom_navigation_bar/home/exercise_tab_bar/beginner_exercise/shoulder_and_back_exercises.dart';
import 'package:fit_verse/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutTabsScreen extends StatefulWidget {
  final String exerciseLevel;
  const WorkoutTabsScreen({super.key, required this.exerciseLevel});

  @override
  State<WorkoutTabsScreen> createState() => _WorkoutTabsScreenState();
}

class _WorkoutTabsScreenState extends State<WorkoutTabsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShoulderAndBackExercises(),
                ),
              );
            },
            child: Container(
              height: 0.15.sh,
              width: 0.85.sw,
              padding: EdgeInsets.only(
                left: 0.05.sw,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/shoulder_back.jpg',
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.8,
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Shoulder & Back ',
                        style: GoogleFonts.poppins(
                          color: white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: widget.exerciseLevel,
                        style: GoogleFonts.figtree(
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChestExercises(),
                ),
              );
            },
            child: Container(
              height: 0.15.sh,
              width: 0.85.sw,
              padding: EdgeInsets.only(
                left: 0.05.sw,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/chest.jpg',
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.8,
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Chest ',
                        style: GoogleFonts.poppins(
                          color: white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: widget.exerciseLevel,
                        style: GoogleFonts.figtree(
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 0.15.sh,
              width: 0.85.sw,
              padding: EdgeInsets.only(
                left: 0.05.sw,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/abs.jpg',
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.8,
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Abs ',
                        style: GoogleFonts.poppins(
                          color: white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: widget.exerciseLevel,
                        style: GoogleFonts.figtree(
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 0.15.sh,
              width: 0.85.sw,
              padding: EdgeInsets.only(
                left: 0.05.sw,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/legs.jpg',
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.8,
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Legs ',
                        style: GoogleFonts.poppins(
                          color: white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: widget.exerciseLevel,
                        style: GoogleFonts.figtree(
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.05.sh,
          ),
        ],
      ),
    );
  }
}
