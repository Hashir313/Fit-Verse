import 'package:fit_verse/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  String dropdownValue = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        toolbarHeight: 0.15.sh,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning! 👋',
                style: GoogleFonts.poppins(
                  color: secondaryColor,
                  fontSize: 14,
                ),
              ),
              Text(
                'Adil Jafri',
                style: GoogleFonts.poppins(
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 0.06.sw,
              foregroundImage: const AssetImage('assets/images/male.png'),
              backgroundColor: secondaryColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Workout Graph Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  // Graph Header with Toggle Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Workout',
                        style: GoogleFonts.roboto(
                          color: white,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        children: [
                          _buildToggleButton('Daily', false),
                          _buildToggleButton('Weekly', true),
                          _buildToggleButton('Monthly', false),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  // Line Chart
                  Container(
                      height: 150.h,
                      padding: const EdgeInsets.all(5),
                      child: LineChart(
                        LineChartData(
                          gridData: const FlGridData(show: false),
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 22,
                                getTitlesWidget: (value, meta) {
                                  const days = [
                                    'Mon',
                                    'Tue',
                                    'Wed',
                                    'Thu',
                                    'Fri',
                                    'Sat',
                                    'Sun'
                                  ];
                                  return Text(
                                    days[value.toInt()],
                                    style: const TextStyle(
                                      color: Colors
                                          .orange, // Set x-axis text color
                                      fontSize: 12,
                                    ),
                                  );
                                },
                                interval: 1,
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 32,
                                interval: 50, // Set intervals for y-axis
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: TextStyle(
                                      color:
                                          secondaryColor, // Set y-axis text color
                                      fontSize: 8,
                                    ),
                                  );
                                },
                              ),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              ), // Hide top titles
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              ), // Hide right titles
                            ),
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(color: Colors.white12),
                          ),
                          minX: 0,
                          maxX: 6,
                          minY: 0,
                          maxY: 300,
                          lineBarsData: [
                            LineChartBarData(
                              spots: const [
                                FlSpot(0, 50),
                                FlSpot(1, 120),
                                FlSpot(2, 80),
                                FlSpot(3, 200),
                                FlSpot(4, 150),
                                FlSpot(5, 180),
                                FlSpot(6, 100),
                              ],
                              isCurved: true,
                              color: Colors.orange,
                              barWidth: 3,
                              isStrokeCapRound: true,
                              belowBarData: BarAreaData(show: false),
                              dotData: const FlDotData(show: true),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            // History Section
            Text(
              'History',
              style: GoogleFonts.poppins(
                color: black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8.h),
            // Filter Dropdown
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton(
                  dropdownColor: black,
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  value: dropdownValue,
                  items: ['All', 'AI Plan', 'Freestyle']
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: secondaryColor, fontSize: 12),
                            ),
                          ))
                      .toList(),
                  icon: Icon(Icons.arrow_drop_down, color: secondaryColor),
                  underline: Container(),
                ),
              ),
            ),
            //! Workout History List
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _buildHistoryCard(
                    date: '12/12/24',
                    calories: '250 kcal',
                    duration: '30 min',
                    type: index == 0 ? 'AI Plan' : 'Freestyle',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0.01.sh, horizontal: 0.02.sw),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: isSelected ? white : secondaryColor,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryCard({
    required String date,
    required String calories,
    required String duration,
    required String type,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: primaryColor,
                    size: 20,
                  ),
                  SizedBox(width: 0.02.sw),
                  Text(
                    'Date: $date',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(
                    Icons.fireplace_outlined,
                    color: primaryColor,
                    size: 20,
                  ),
                  SizedBox(width: 0.02.sw),
                  RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Calories Burned: ',
                        style: GoogleFonts.poppins(
                          color: white,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: calories,
                        style: GoogleFonts.poppins(
                          color: primaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(
                    Icons.hourglass_bottom_outlined,
                    color: primaryColor,
                    size: 20,
                  ),
                  SizedBox(width: 0.02.sw),
                  RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Duration: ',
                        style: GoogleFonts.poppins(
                          color: white,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: duration,
                        style: GoogleFonts.poppins(
                          color: primaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(
                    Icons.fitness_center_outlined,
                    color: primaryColor,
                    size: 20,
                  ),
                  SizedBox(width: 0.02.sw),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Type: ',
                          style: GoogleFonts.poppins(
                            color: white,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: type,
                          style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
