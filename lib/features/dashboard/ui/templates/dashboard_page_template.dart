import 'package:flutter/material.dart';
import '../molecules/molecules.dart';
import '../organisms/organisms.dart';
import '../../../cards/ui/organisms/organisms.dart';

class DashboardPageTemplate extends StatelessWidget {
  final double balance;
  final String userName;
  final String currency;
  final int selectedIndex;
  final Function(int) onBottomNavTap;
  final List<Map<String, dynamic>>? cards;
  final Function(Map<String, dynamic>)? onCardTap;
  final VoidCallback? onAddCard;

  const DashboardPageTemplate({
    super.key,
    required this.balance,
    required this.userName,
    this.currency = '\$',
    required this.selectedIndex,
    required this.onBottomNavTap,
    this.cards,
    this.onCardTap,
    this.onAddCard,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(_getAppBarTitle()),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          if (selectedIndex == 0) // Cards tab
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: onAddCard,
            ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: selectedIndex,
        onTap: onBottomNavTap,
      ),
    );
  }

  String _getAppBarTitle() {
    switch (selectedIndex) {
      case 0:
        return 'My Cards';
      case 1:
        return 'Wallet';
      case 2:
        return 'Profile';
      default:
        return 'Dashboard';
    }
  }

  Widget _buildBody() {
    switch (selectedIndex) {
      case 0:
        // Cards tab
        if (cards == null || cards!.isEmpty) {
          return const Center(
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
          );
        }
        return CardList(
          cards: cards!,
          onCardTap: onCardTap,
        );
      case 1:
        // Wallet tab
        return const Center(
          child: Text(
            'Wallet feature coming soon',
            style: TextStyle(fontSize: 18),
          ),
        );
      case 2:
        // Profile tab
        return const Center(
          child: Text(
            'Profile feature coming soon',
            style: TextStyle(fontSize: 18),
          ),
        );
      default:
        return DashboardContent(
          balance: balance,
          userName: userName,
          currency: currency,
        );
    }
  }
}
