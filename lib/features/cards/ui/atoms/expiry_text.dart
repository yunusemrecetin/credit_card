import 'package:flutter/material.dart';

class ExpiryText extends StatelessWidget {
  final String expiryDate;
  final TextStyle? textStyle;

  const ExpiryText({
    super.key,
    required this.expiryDate,
    this.textStyle,
  });

  String _formatExpiryDate(String date) {
    if (date.length == 4) {
      return '${date.substring(0, 2)}/${date.substring(2)}';
    }
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatExpiryDate(expiryDate),
      style: textStyle ?? const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.0,
      ),
    );
  }
}
