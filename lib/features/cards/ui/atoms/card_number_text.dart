import 'package:flutter/material.dart';

class CardNumberText extends StatelessWidget {
  final String cardNumber;
  final TextStyle? textStyle;
  final bool isObscured;

  const CardNumberText({
    super.key,
    required this.cardNumber,
    this.textStyle,
    this.isObscured = false,
  });

  String _formatCardNumber(String number) {
    if (isObscured) {
      return '**** **** **** ${number.substring(number.length - 4)}';
    }
    return number.replaceAllMapped(
      RegExp(r'.{4}'),
      (match) => '${match.group(0)} ',
    ).trim();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatCardNumber(cardNumber),
      style: textStyle ?? const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: 2.0,
      ),
    );
  }
}
