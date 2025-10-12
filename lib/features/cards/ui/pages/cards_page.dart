import 'package:auto_route/auto_route.dart';
import 'package:base_project/so_like_app.dart';
import 'package:flutter/material.dart';
import '../templates/templates.dart';
import '../organisms/organisms.dart';

@RoutePage(name: "CardsPage")
class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  int _selectedIndex = 0;
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

    // Handle tab switching with auto_route navigation
    switch (index) {
      case 0:
        // Cards tab - already on cards page
        break;
      case 1:
        // Wallet tab - navigate to wallet page
        context.router.pushPath('/wallet');
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
    return CardsPageTemplate(
      cards: cards,
      onCardTap: _onCardTap,
      onAddCard: _onAddCard,
      selectedIndex: _selectedIndex,
      onBottomNavTap: _onBottomNavTap,
    );
  }
}
