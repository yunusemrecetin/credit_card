import 'package:flutter/material.dart';
import '../atoms/wallet_card.dart';

class WalletCardStack extends StatefulWidget {
  final List<Map<String, dynamic>> cards;
  final Function(Map<String, dynamic>)? onCardTap;

  const WalletCardStack({
    super.key,
    required this.cards,
    this.onCardTap,
  });

  @override
  State<WalletCardStack> createState() => _WalletCardStackState();
}

class _WalletCardStackState extends State<WalletCardStack>
    with TickerProviderStateMixin {
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32), // pt-8 pb-20
      child: SingleChildScrollView(
        child: SizedBox(
          height: 200 + (widget.cards.length - 1) * 80.0, // Calculate total height for 40% spacing
          child: Stack(
            children: widget.cards.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> card = entry.value;
              
              // Calculate offset for stacking effect - 40% spacing between cards
              double cardHeight = 200.0; // Height of each card
              double spacingPercentage = 0.4; // 40% spacing
              double spacing = cardHeight * spacingPercentage; // 80px spacing
              double baseOffset = index * spacing; // Stack with 40% spacing
              double hoverOffset = 0;
              
              if (hoveredIndex != null) {
                if (hoveredIndex! < index) {
                  // Cards below hovered card move down
                  hoverOffset = 16.0; // translateY(1rem)
                } else if (hoveredIndex! > index) {
                  // Cards above hovered card move down more
                  hoverOffset = 32.0; // translateY(2rem)
                } else {
                  // Hovered card moves up
                  hoverOffset = -16.0; // translateY(-1rem)
                }
              }
              
              return Positioned(
                top: baseOffset + hoverOffset,
                left: 0,
                right: 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: MouseRegion(
                    onEnter: (_) => setState(() => hoveredIndex = index),
                    onExit: (_) => setState(() => hoveredIndex = null),
                    child: WalletCard(
                      day: card['day'],
                      date: card['date'],
                      cardType: card['cardType'],
                      backgroundColor: card['backgroundColor'],
                      content: card['content'],
                      text: card['text'],
                      bankName: card['bankName'],
                      hasLogo: card['hasLogo'] ?? false,
                      hasChip: card['hasChip'] ?? false,
                      cardNumber: card['cardNumber'],
                      hasNFC: card['hasNFC'] ?? true, // Default to true for HTML design
                      cardImageUrl: card['cardImageUrl'],
                      onTap: () => widget.onCardTap?.call(card),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
