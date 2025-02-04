import 'package:fit_verse/screens/bottom_navigation_bar/diet/diet_tab/diet_time_screen.dart';
import 'package:fit_verse/utils/colors.dart';
import 'package:fit_verse/utils/responsive_text.dart';
import 'package:fit_verse/widgets/circular_percentage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen>
    with SingleTickerProviderStateMixin {
  String? username = 'Adil Jafri';
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
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'My Diet Plan\n',
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
                          ],
                        ),
                      ),
                      const CircularPercentage(
                        percentage: 25,
                      ),
                    ],
                  ),
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
                  Tab(text: "Breakfast"),
                  Tab(text: "Lunch"),
                  Tab(text: "Dinner"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    DietPlanDetails(),
                    DietPlanDetails(),
                    DietPlanDetails(),
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
