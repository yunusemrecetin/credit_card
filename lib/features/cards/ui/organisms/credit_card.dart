import 'package:flutter/material.dart';
import '../atoms/atoms.dart';
import '../molecules/molecules.dart';

class CreditCard extends StatelessWidget {
  final String cardNumber;
  final String holderName;
  final String expiryDate;
  final String cardType;
  final Color? backgroundColor;
  final Color? iconColor;
  final bool isObscured;
  final VoidCallback? onTap;

  const CreditCard({
    super.key,
    required this.cardNumber,
    required this.holderName,
    required this.expiryDate,
    required this.cardType,
    this.backgroundColor,
    this.iconColor,
    this.isObscured = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: backgroundColor != null
                ? [backgroundColor!, backgroundColor!.withOpacity(0.8)]
                : [
                    const Color(0xFF1E3A8A),
                    const Color(0xFF3B82F6),
                  ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardHeader(
              cardType: cardType,
              iconColor: iconColor,
            ),
            const Spacer(),
            CardNumberText(
              cardNumber: cardNumber,
              isObscured: isObscured,
            ),
            const SizedBox(height: 20),
            CardFooter(
              holderName: holderName,
              expiryDate: expiryDate,
            ),
          ],
        ),
      ),
    );
  }
}
