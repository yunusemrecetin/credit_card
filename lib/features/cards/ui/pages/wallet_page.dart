import 'package:base_project/so_like_app.dart';
import 'package:flutter/material.dart';
import '../templates/wallet_page_template.dart';
import '../organisms/organisms.dart';

@RoutePage(name: "WalletPage")
class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> _filteredCards = [];

  // Card data matching the image exactly
  List<Map<String, dynamic>> walletCards = [
    {
      'day': 'TUE',
      'date': '28',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFF2D3748), // Dark slate gray
      'content': 'white_card',
      'text': '',
      'bankName': 'Generic Bank',
    },
    {
      'day': 'MON',
      'date': '27',
      'cardType': 'bank_of_america',
      'backgroundColor': const Color(0xFF1E3A8A), // Dark blue
      'content': 'credit_card',
      'bankName': 'BANK OF AMERICA',
      'hasLogo': true,
    },
    {
      'day': 'SUN',
      'date': '26',
      'cardType': 'citi',
      'backgroundColor': const Color(0xFF1E3A8A), // Dark blue
      'content': 'credit_card',
      'bankName': 'Citi',
      'hasLogo': false,
    },
    {
      'day': 'SAT',
      'date': '25',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFF7E7CE), // Light peach/beige
      'content': 'white_card',
      'text': 'NNJOLKADO',
      'bankName': 'Custom Bank',
    },
    {
      'day': 'FRI',
      'date': '24',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFF8BBD9), // Light pink
      'content': 'credit_card',
      'hasChip': true,
      'bankName': 'Pink Bank',
    },
    {
      'day': 'THU',
      'date': '23',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFFFD700), // Yellow-orange gradient
      'content': 'credit_card',
      'cardNumber': '4321',
      'hasNFC': true,
      'bankName': 'Gold Bank',
    },
    {
      'day': 'THU',
      'date': '23',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFFFD700), // Yellow-orange gradient
      'content': 'credit_card',
      'cardNumber': '4321',
      'hasNFC': true,
      'bankName': 'Premium Bank',
    },
    {
      'day': 'THU',
      'date': '23',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFFFD700), // Yellow-orange gradient
      'content': 'credit_card',
      'cardNumber': '4321',
      'hasNFC': true,
      'bankName': 'Elite Bank',
    },
    {
      'day': 'THU',
      'date': '23',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFFFD700), // Yellow-orange gradient
      'content': 'credit_card',
      'cardNumber': '4321',
      'hasNFC': true,
      'bankName': 'Royal Bank',
    },
    {
      'day': 'THU',
      'date': '23',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFFFD700), // Yellow-orange gradient
      'content': 'credit_card',
      'cardNumber': '4321',
      'hasNFC': true,
      'bankName': 'Crown Bank',
    },
    {
      'day': 'THU',
      'date': '23',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFFFD700), // Yellow-orange gradient
      'content': 'credit_card',
      'cardNumber': '4321',
      'hasNFC': true,
      'bankName': 'Imperial Bank',
    },
    {
      'day': 'THU',
      'date': '23',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFFFD700), // Yellow-orange gradient
      'content': 'credit_card',
      'cardNumber': '4321',
      'hasNFC': true,
      'bankName': 'Noble Bank',
    },
  ];

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Cards tab - already showing
        break;
      case 1:
        // Activity tab
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Activity feature coming soon'),
            backgroundColor: Colors.black87,
          ),
        );
        break;
      case 2:
        // Calculator tab
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Calculator feature coming soon'),
            backgroundColor: Colors.black87,
          ),
        );
        break;
      case 3:
        // Settings tab
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Settings feature coming soon'),
            backgroundColor: Colors.black87,
          ),
        );
        break;
    }
  }

  void _onCardTap(Map<String, dynamic> card) {
    // Show card details bottom sheet with custom animation
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => CardDetailsBottomSheet(
          card: card,
          scrollController: scrollController,
        ),
      ),
    );
  }

  void _onSortCards() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sort cards functionality'),
        backgroundColor: Colors.black87,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _filteredCards = List.from(walletCards);
  }

  void _onAddCard() {
    // Show add card bottom sheet
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (context) => const AddCardBottomSheet(),
    );
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCards = List.from(walletCards);
      } else {
        _filteredCards = walletCards.where((card) {
          final bankName = (card['bankName'] ?? '').toLowerCase();
          final cardType = (card['cardType'] ?? '').toLowerCase();
          final content = (card['content'] ?? '').toLowerCase();
          final searchLower = query.toLowerCase();
          
          return bankName.contains(searchLower) ||
                 cardType.contains(searchLower) ||
                 content.contains(searchLower) ||
                 'credit card'.contains(searchLower) ||
                 'debit card'.contains(searchLower) ||
                 'virtual'.contains(searchLower) ||
                 'physical'.contains(searchLower);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WalletPageTemplate(
      selectedIndex: _selectedIndex,
      onBottomNavTap: _onBottomNavTap,
      walletCards: _filteredCards,
      onCardTap: _onCardTap,
      onSortCards: _onSortCards,
      onAddCard: _onAddCard,
      onSearchChanged: _onSearchChanged,
    );
  }
}
