import 'package:flutter/material.dart';

class HolderNameText extends StatelessWidget {
  final String holderName;
  final TextStyle? textStyle;

  const HolderNameText({
    super.key,
    required this.holderName,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      holderName.toUpperCase(),
      style: textStyle ?? const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.0,
      ),
    );
  }
}
