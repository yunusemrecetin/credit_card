import 'package:flutter/material.dart';
import '../atoms/atoms.dart';

class CardFooter extends StatelessWidget {
  final String holderName;
  final String expiryDate;

  const CardFooter({
    super.key,
    required this.holderName,
    required this.expiryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: HolderNameText(holderName: holderName),
        ),
        ExpiryText(expiryDate: expiryDate),
      ],
    );
  }
}
