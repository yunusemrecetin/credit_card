import 'package:flutter/material.dart';
import 'animated_spinner.dart';

class WalletCard extends StatelessWidget {
  final String day;
  final String date;
  final String cardType;
  final Color backgroundColor;
  final String content;
  final String? text;
  final String? bankName;
  final bool hasLogo;
  final bool hasChip;
  final String? cardNumber;
  final bool hasNFC;
  final VoidCallback? onTap;
  final String? cardImageUrl;

  const WalletCard({
    super.key,
    required this.day,
    required this.date,
    required this.cardType,
    required this.backgroundColor,
    required this.content,
    this.text,
    this.bankName,
    this.hasLogo = false,
    this.hasChip = false,
    this.cardNumber,
    this.hasNFC = false,
    this.onTap,
    this.cardImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200, // aspect ratio 1.586 for credit card
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), // rounded-xl
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
            // Top shadow for better separation from cards behind
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              // Card background image or gradient
              if (cardImageUrl != null)
                Image.network(
                  cardImageUrl!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                )
              else
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        backgroundColor,
                        backgroundColor.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
              
              // Card content overlay
              Positioned.fill(
                child: Container(
                  padding: const EdgeInsets.all(24), // p-6
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Bank name at the top
                      if (bankName != null)
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            bankName!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      
                      // Top row with spinner, date, and drag indicator
                      Row(
                        children: [
                          AnimatedSpinner(
                            dayText: day,
                            size: 48,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            date,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.drag_indicator,
                            color: Colors.white.withOpacity(0.5),
                            size: 20,
                          ),
                        ],
                      ),
                      
                      // Bottom row with card number and NFC icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Card number
                          if (cardNumber != null)
                            Text(
                              '•••• •••• •••• $cardNumber',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'monospace',
                                letterSpacing: 2,
                              ),
                            ),
                          
                          // NFC icon
                          if (hasNFC)
                            const Icon(
                              Icons.nfc,
                              color: Colors.white,
                              size: 36,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
