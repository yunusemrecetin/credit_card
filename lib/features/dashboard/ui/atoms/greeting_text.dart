import 'package:flutter/material.dart';

class GreetingText extends StatelessWidget {
  final String name;
  final TextStyle? textStyle;

  const GreetingText({
    super.key,
    required this.name,
    this.textStyle,
  });

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_getGreeting()}, $name',
      style: textStyle ?? const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white70,
      ),
    );
  }
}
