import 'package:fit_verse/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DietPlanDetails extends StatefulWidget {
  const DietPlanDetails({
    super.key,
  });

  @override
  State<DietPlanDetails> createState() => _DietPlanDetailsState();
}

class _DietPlanDetailsState extends State<DietPlanDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 0.35.sh,
                width: 0.9.sw,
                padding: EdgeInsets.only(
                  left: 0.05.sw,
                ),
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Boiled Eggs with\n Green Tea',
                          style: GoogleFonts.poppins(
                            color: white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Calories: ',
                                style: GoogleFonts.roboto(
                                  color: white,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: '200 kcal',
                                style: GoogleFonts.roboto(
                                  color: primaryColor,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: '\n\nNutrients: ',
                                style: GoogleFonts.roboto(
                                  color: white,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: '\n\u2022 Protein: 20g',
                                style: GoogleFonts.roboto(
                                  color: primaryColor,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: '\n\u2022 Carbs: 20g',
                                style: GoogleFonts.roboto(
                                  color: primaryColor,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: '\n\u2022 Fats: 20g',
                                style: GoogleFonts.roboto(
                                  color: primaryColor,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: '\n\nIngeridients: ',
                                style: GoogleFonts.roboto(
                                  color: white,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: '\n\u2022 2 boiled eggs',
                                style: GoogleFonts.roboto(
                                  color: primaryColor,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: '\n\u2022 1 cup green tea',
                                style: GoogleFonts.roboto(
                                  color: primaryColor,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 0.2.sh,
                      width: 0.35.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: const DecorationImage(
                          image:
                              AssetImage('assets/images/first_breakfast.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 0.35.sh,
              width: 0.9.sw,
              padding: EdgeInsets.only(
                left: 0.05.sw,
              ),
              decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chickpea Salad',
                        style: GoogleFonts.poppins(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Calories: ',
                              style: GoogleFonts.roboto(
                                color: white,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: '250 kcal',
                              style: GoogleFonts.roboto(
                                color: primaryColor,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: '\n\nNutrients: ',
                              style: GoogleFonts.roboto(
                                color: white,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: '\n\u2022 Protein: 8g',
                              style: GoogleFonts.roboto(
                                color: primaryColor,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: '\n\u2022 Carbs: 30g',
                              style: GoogleFonts.roboto(
                                color: primaryColor,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: '\n\u2022 Fats: 7g',
                              style: GoogleFonts.roboto(
                                color: primaryColor,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: '\n\nIngeridients: ',
                              style: GoogleFonts.roboto(
                                color: white,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: '\n\u2022 2 boiled eggs',
                              style: GoogleFonts.roboto(
                                color: primaryColor,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: '\n\u2022 1 cup green tea',
                              style: GoogleFonts.roboto(
                                color: primaryColor,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 0.2.sh,
                    width: 0.35.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/second_breakfast.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.02.sh,
          ),
        ],
      ),
    );
  }
}
