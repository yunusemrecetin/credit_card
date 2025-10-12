import 'package:flutter/material.dart';

class BalanceText extends StatelessWidget {
  final double balance;
  final String currency;
  final TextStyle? textStyle;

  const BalanceText({
    super.key,
    required this.balance,
    this.currency = '\$',
    this.textStyle,
  });

  String _formatBalance(double balance) {
    return '$currency${balance.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatBalance(balance),
      style: textStyle ?? const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
