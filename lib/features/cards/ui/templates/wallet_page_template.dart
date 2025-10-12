import 'package:flutter/material.dart';
import '../organisms/wallet_card_stack.dart';

class WalletPageTemplate extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onBottomNavTap;
  final List<Map<String, dynamic>> walletCards;
  final Function(Map<String, dynamic>)? onCardTap;
  final VoidCallback? onSortCards;
  final VoidCallback? onAddCard;

  const WalletPageTemplate({
    super.key,
    required this.selectedIndex,
    this.onBottomNavTap,
    required this.walletCards,
    this.onCardTap,
    this.onSortCards,
    this.onAddCard,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191919), // background-dark
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation Bar
            _buildTopNavigationBar(),

            // Main Content Area
            Expanded(
              child: Container(
                color: const Color(0xFF191919), // background-dark
                child: WalletCardStack(
                  cards: walletCards,
                  onCardTap: onCardTap,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTopNavigationBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFF191919).withOpacity(0.8), // background-dark/80
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            // Left icon - inbox
            IconButton(
              icon: const Icon(
                Icons.inbox_outlined,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () {},
            ),

            // Center title
            Expanded(
              child: Center(
                child: Text(
                  'Wallet',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),

            // Right icons
            Row(
              children: [
                // Sort icon
                IconButton(
                  icon: const Icon(
                    Icons.swap_vert,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: onSortCards,
                ),
                // Add icon with background
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF141414).withOpacity(0.3), // primary/30
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: onAddCard,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF191919).withOpacity(0.8), // background-dark/80
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.credit_card,
            label: 'Cards',
            index: 0,
            isActive: selectedIndex == 0,
          ),
          _buildNavItem(
            icon: Icons.history,
            label: 'Activity',
            index: 1,
            isActive: selectedIndex == 1,
          ),
          _buildNavItem(
            icon: Icons.calculate,
            label: 'Calculator',
            index: 2,
            isActive: selectedIndex == 2,
          ),
          _buildNavItem(
            icon: Icons.settings,
            label: 'Settings',
            index: 3,
            isActive: selectedIndex == 3,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => onBottomNavTap?.call(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? const Color(0xFF3B82F6) : const Color(0xFF9CA3AF), // blue-500 : gray-400
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? const Color(0xFF3B82F6) : const Color(0xFF9CA3AF), // blue-500 : gray-400
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
