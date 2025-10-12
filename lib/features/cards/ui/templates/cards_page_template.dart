import 'package:flutter/material.dart';
import '../organisms/organisms.dart';

class CardsPageTemplate extends StatelessWidget {
  final List<Map<String, dynamic>> cards;
  final Function(Map<String, dynamic>)? onCardTap;
  final VoidCallback? onAddCard;

  const CardsPageTemplate({
    super.key,
    required this.cards,
    this.onCardTap,
    this.onAddCard,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cards'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddCard,
          ),
        ],
      ),
      body: cards.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.credit_card_off,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No cards added yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tap the + button to add your first card',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : CardList(
              cards: cards,
              onCardTap: onCardTap,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddCard,
        child: const Icon(Icons.add),
      ),
    );
  }
}
