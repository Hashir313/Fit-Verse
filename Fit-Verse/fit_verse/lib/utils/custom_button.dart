import 'package:fit_verse/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  final bool isLoading;
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50.sp),
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  color: white,
                  strokeWidth: 10.0.sp,
                )
              : Text(
                  buttonText,
                  style: TextStyle(
                    color: white,
                    fontSize: 80.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
