import 'package:base_project/so_like_app.dart';
import 'package:flutter/material.dart';
import '../templates/templates.dart';

@RoutePage(name: "DashboardPage")
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final double _balance = 2500.75;
  final String _userName = 'John';
  
  List<Map<String, dynamic>> cards = [
    {
      'cardNumber': '4532123456789012',
      'holderName': 'John Doe',
      'expiryDate': '12/25',
      'cardType': 'Visa',
      'backgroundColor': const Color(0xFF1E3A8A),
      'iconColor': Colors.white,
      'isObscured': true,
    },
    {
      'cardNumber': '5555555555554444',
      'holderName': 'Jane Smith',
      'expiryDate': '08/26',
      'cardType': 'Mastercard',
      'backgroundColor': const Color(0xFF059669),
      'iconColor': Colors.white,
      'isObscured': true,
    },
    {
      'cardNumber': '378282246310005',
      'holderName': 'Bob Johnson',
      'expiryDate': '03/27',
      'cardType': 'Amex',
      'backgroundColor': const Color(0xFFDC2626),
      'iconColor': Colors.white,
      'isObscured': true,
    },
  ];

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle tab switching
    switch (index) {
      case 0:
        // Cards tab - navigate to wallet page
        context.router.pushNamed('/wallet');
        break;
      case 1:
        // Wallet tab
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wallet feature coming soon'),
          ),
        );
        break;
      case 2:
        // Profile tab
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile feature coming soon'),
          ),
        );
        break;
    }
  }

  void _onCardTap(Map<String, dynamic> card) {
    // Handle card tap - could show card details or toggle visibility
    setState(() {
      card['isObscured'] = !card['isObscured'];
    });
  }

  void _onAddCard() {
    // Handle add card - could navigate to add card screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Add card functionality will be implemented'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DashboardPageTemplate(
      balance: _balance,
      userName: _userName,
      selectedIndex: _selectedIndex,
      onBottomNavTap: _onBottomNavTap,
      cards: cards,
      onCardTap: _onCardTap,
      onAddCard: _onAddCard,
    );
  }
}
