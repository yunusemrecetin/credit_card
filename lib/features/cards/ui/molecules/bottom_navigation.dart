import 'package:flutter/material.dart';
import '../atoms/nav_icon.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavIcon(
                icon: Icons.credit_card,
                label: 'Cards',
                isSelected: selectedIndex == 0,
                onTap: () => onTap(0),
              ),
              NavIcon(
                icon: Icons.account_balance_wallet,
                label: 'Wallet',
                isSelected: selectedIndex == 1,
                onTap: () => onTap(1),
              ),
              NavIcon(
                icon: Icons.person,
                label: 'Profile',
                isSelected: selectedIndex == 2,
                onTap: () => onTap(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
