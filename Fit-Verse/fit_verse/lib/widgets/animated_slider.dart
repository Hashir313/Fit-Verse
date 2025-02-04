import 'package:fit_verse/utils/colors.dart';
import 'package:flutter/material.dart';

class AnimatedSlider extends StatefulWidget {
  final int currentIndex;
  const AnimatedSlider({super.key, required this.currentIndex});

  @override
  State<AnimatedSlider> createState() => _AnimatedSliderState();
}

class _AnimatedSliderState extends State<AnimatedSlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: index <= widget.currentIndex ? 30 : 15,
          height: 5,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: index <= widget.currentIndex
                ? primaryColor
                : Colors.grey.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
