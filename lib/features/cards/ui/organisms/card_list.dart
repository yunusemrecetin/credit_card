import 'package:flutter/material.dart';
import 'credit_card.dart';

class CardList extends StatelessWidget {
  final List<Map<String, dynamic>> cards;
  final Function(Map<String, dynamic>)? onCardTap;

  const CardList({
    super.key,
    required this.cards,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: CreditCard(
            cardNumber: card['cardNumber'] ?? '',
            holderName: card['holderName'] ?? '',
            expiryDate: card['expiryDate'] ?? '',
            cardType: card['cardType'] ?? 'Visa',
            backgroundColor: card['backgroundColor'],
            iconColor: card['iconColor'],
            isObscured: card['isObscured'] ?? true,
            onTap: () => onCardTap?.call(card),
          ),
        );
      },
    );
  }
}
