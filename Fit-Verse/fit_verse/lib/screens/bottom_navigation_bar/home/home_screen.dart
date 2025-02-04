import 'package:fit_verse/screens/bottom_navigation_bar/home/exercise_tab_bar/exercise_screen.dart';
import 'package:fit_verse/utils/colors.dart';
import 'package:fit_verse/utils/responsive_text.dart';
import 'package:fit_verse/widgets/circular_percentage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  String? username = 'Adil Jafri';
  String? completedExercises = '1';
  String? totalExercises = '7';
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.15.sh,
          title: Padding(
            padding: EdgeInsets.only(
              left: 85.0.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning! 👋',
                  style: GoogleFonts.poppins(
                    color: secondaryColor,
                    fontSize: const ResponsiveTextSize().getResponsiveTextSize(
                      context,
                      12,
                    ),
                  ),
                ),
                Text(
                  username ?? '',
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.bold,
                    fontSize: const ResponsiveTextSize().getResponsiveTextSize(
                      context,
                      20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 120.0.w,
              ),
              child: CircleAvatar(
                radius: 0.06.sw,
                foregroundImage: const AssetImage(
                  'assets/images/male.png',
                ),
                backgroundColor: secondaryColor,
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 0.18.sh,
                width: 0.85.sw,
                decoration: BoxDecoration(
                  color: const Color(0xffFF972A),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Exercise Plan\n',
                            style: GoogleFonts.poppins(
                              color: white,
                              fontSize: const ResponsiveTextSize()
                                  .getResponsiveTextSize(
                                context,
                                20,
                              ),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'For Today\n',
                            style: GoogleFonts.poppins(
                              color: white,
                              fontSize: const ResponsiveTextSize()
                                  .getResponsiveTextSize(
                                context,
                                20,
                              ),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                              text:
                                  '$completedExercises/$totalExercises Completed'),
                        ],
                      ),
                    ),
                    const CircularPercentage(
                      percentage: 25,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              //! Adding TabBar here
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: black,
                unselectedLabelColor: secondaryColor,
                labelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                ),
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(text: "Beginner"),
                  Tab(text: "Intermediate"),
                  Tab(text: "Advanced"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    WorkoutTabsScreen(
                      exerciseLevel: 'Beginner',
                    ),
                    WorkoutTabsScreen(
                      exerciseLevel: 'Intermediate',
                    ),
                    WorkoutTabsScreen(
                      exerciseLevel: 'Advanced',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
