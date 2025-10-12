import 'package:flutter/material.dart';

class AnimatedSpinner extends StatelessWidget {
  final String dayText;
  final double size;

  const AnimatedSpinner({
    super.key,
    required this.dayText,
    this.size = 48.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          // Static outer ring (no animation)
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const SweepGradient(
                colors: [
                  Color(0xFFf97316), // orange-500
                  Color(0xFFfb923c), // orange-400
                  Color(0xFF191919), // background-dark
                  Color(0xFF191919), // background-dark
                ],
                stops: [0.0, 0.5, 0.5, 1.0],
              ),
            ),
          ),
          // Inner circle
          Center(
            child: Container(
              width: size * 0.85,
              height: size * 0.85,
              decoration: const BoxDecoration(
                color: Color(0xFF191919), // background-dark
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  dayText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
