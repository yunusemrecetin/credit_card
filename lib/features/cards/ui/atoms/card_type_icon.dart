import 'package:flutter/material.dart';

class CardTypeIcon extends StatelessWidget {
  final String cardType;
  final double size;
  final Color? color;

  const CardTypeIcon({
    super.key,
    required this.cardType,
    this.size = 24.0,
    this.color,
  });

  IconData _getIconForCardType(String type) {
    switch (type.toLowerCase()) {
      case 'visa':
        return Icons.credit_card;
      case 'mastercard':
        return Icons.credit_card;
      case 'amex':
        return Icons.credit_card;
      default:
        return Icons.credit_card;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      _getIconForCardType(cardType),
      size: size,
      color: color ?? Colors.white,
    );
  }
}
