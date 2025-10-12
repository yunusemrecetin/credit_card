import 'package:flutter/material.dart';
import '../atoms/atoms.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  final String userName;
  final String currency;

  const BalanceCard({
    super.key,
    required this.balance,
    required this.userName,
    this.currency = '\$',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E3A8A),
            Color(0xFF3B82F6),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GreetingText(name: userName),
          const SizedBox(height: 16),
          const Text(
            'Total Balance',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          BalanceText(
            balance: balance,
            currency: currency,
          ),
        ],
      ),
    );
  }
}
