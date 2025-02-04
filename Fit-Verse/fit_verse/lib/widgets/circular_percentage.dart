import 'dart:math';
import 'package:fit_verse/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CircularPercentage extends StatelessWidget {
  final double percentage;

  const CircularPercentage({
    super.key,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    double strokeWidth = 10.0;
    double size = 100;
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: CircularPercentagePainter(
          percentage: percentage,
          progressColor: const Color(0xffFF8300),
          strokeWidth: strokeWidth,
        ),
        child: Center(
          child: Text(
            '${percentage.toStringAsFixed(0)}%',
            style: GoogleFonts.poppins(
              fontSize: size / 4,
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
        ),
      ),
    );
  }
}

class CircularPercentagePainter extends CustomPainter {
  final double percentage;
  final Color progressColor;
  final double strokeWidth;

  CircularPercentagePainter({
    required this.percentage,
    required this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - (strokeWidth / 2);

    // Draw background circle (optional)
    final backgroundPaint = Paint()
      ..color = const Color(0xffD9D9D9)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress arc
    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 45, // Start from top
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircularPercentagePainter oldDelegate) {
    return oldDelegate.percentage != percentage ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
