import 'package:flutter/material.dart';
import '../atoms/atoms.dart';

class CardHeader extends StatelessWidget {
  final String cardType;
  final Color? iconColor;

  const CardHeader({
    super.key,
    required this.cardType,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CardChip(),
        CardTypeIcon(
          cardType: cardType,
          color: iconColor,
        ),
      ],
    );
  }
}
