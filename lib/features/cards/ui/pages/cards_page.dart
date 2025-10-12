import 'package:base_project/so_like_app.dart';
import 'package:flutter/material.dart';
import '../templates/templates.dart';

@RoutePage(name: "CardsPage")
class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
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
    return CardsPageTemplate(
      cards: cards,
      onCardTap: _onCardTap,
      onAddCard: _onAddCard,
    );
  }
}
