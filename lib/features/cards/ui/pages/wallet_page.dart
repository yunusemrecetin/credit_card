import 'package:base_project/so_like_app.dart';
import 'package:flutter/material.dart';
import '../templates/wallet_page_template.dart';

@RoutePage(name: "WalletPage")
class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int _selectedIndex = 0;

  // Card data matching the image exactly
  List<Map<String, dynamic>> walletCards = [
    {
      'day': 'TUE',
      'date': '28',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFF2D3748), // Dark slate gray
      'content': 'white_card',
      'text': '',
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
    },
    {
      'day': 'FRI',
      'date': '24',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFF8BBD9), // Light pink
      'content': 'credit_card',
      'hasChip': true,
    },
    {
      'day': 'THU',
      'date': '23',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFFFD700), // Yellow-orange gradient
      'content': 'credit_card',
      'cardNumber': '4321',
      'hasNFC': true,
    },
    {
      'day': 'THU',
      'date': '23',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFFFD700), // Yellow-orange gradient
      'content': 'credit_card',
      'cardNumber': '4321',
      'hasNFC': true,
    },
    {
      'day': 'THU',
      'date': '23',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFFFD700), // Yellow-orange gradient
      'content': 'credit_card',
      'cardNumber': '4321',
      'hasNFC': true,
    },
    {
      'day': 'THU',
      'date': '23',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFFFD700), // Yellow-orange gradient
      'content': 'credit_card',
      'cardNumber': '4321',
      'hasNFC': true,
    },
    {
      'day': 'THU',
      'date': '23',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFFFD700), // Yellow-orange gradient
      'content': 'credit_card',
      'cardNumber': '4321',
      'hasNFC': true,
    },
    {
      'day': 'THU',
      'date': '23',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFFFD700), // Yellow-orange gradient
      'content': 'credit_card',
      'cardNumber': '4321',
      'hasNFC': true,
    },
    {
      'day': 'THU',
      'date': '23',
      'cardType': 'generic',
      'backgroundColor': const Color(0xFFFFD700), // Yellow-orange gradient
      'content': 'credit_card',
      'cardNumber': '4321',
      'hasNFC': true,
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
    // Handle card tap - could show card details
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${card['day']} ${card['date']} card tapped'),
        backgroundColor: Colors.black87,
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

  void _onAddCard() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Add card functionality'),
        backgroundColor: Colors.black87,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WalletPageTemplate(
      selectedIndex: _selectedIndex,
      onBottomNavTap: _onBottomNavTap,
      walletCards: walletCards,
      onCardTap: _onCardTap,
      onSortCards: _onSortCards,
      onAddCard: _onAddCard,
    );
  }
}
