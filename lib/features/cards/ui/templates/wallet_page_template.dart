import 'package:flutter/material.dart';
import '../organisms/wallet_card_stack.dart';
import 'dart:ui';

class WalletPageTemplate extends StatefulWidget {
  final int selectedIndex;
  final Function(int)? onBottomNavTap;
  final List<Map<String, dynamic>> walletCards;
  final Function(Map<String, dynamic>)? onCardTap;
  final VoidCallback? onSortCards;
  final VoidCallback? onAddCard;
  final VoidCallback? onFilterCards;
  final Function(String)? onSearchChanged;

  const WalletPageTemplate({
    super.key,
    required this.selectedIndex,
    this.onBottomNavTap,
    required this.walletCards,
    this.onCardTap,
    this.onSortCards,
    this.onAddCard,
    this.onFilterCards,
    this.onSearchChanged,
  });

  @override
  State<WalletPageTemplate> createState() => _WalletPageTemplateState();
}

class _WalletPageTemplateState extends State<WalletPageTemplate> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchExpanded = false;
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearchExpanded = !_isSearchExpanded;
      if (!_isSearchExpanded) {
        _searchController.clear();
        _searchQuery = '';
        widget.onSearchChanged?.call('');
      }
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
    widget.onSearchChanged?.call(query);
  }

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
                  cards: widget.walletCards,
                  onCardTap: widget.onCardTap,
                  stickySearchBar: _buildStickySearchBar(),
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
                  onPressed: widget.onSortCards,
                ),
                // Add icon with background
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color:
                        const Color(0xFF141414).withOpacity(0.3), // primary/30
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: widget.onAddCard,
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
            isActive: widget.selectedIndex == 0,
          ),
          _buildNavItem(
            icon: Icons.history,
            label: 'Activity',
            index: 1,
            isActive: widget.selectedIndex == 1,
          ),
          _buildNavItem(
            icon: Icons.calculate,
            label: 'Calculator',
            index: 2,
            isActive: widget.selectedIndex == 2,
          ),
          _buildNavItem(
            icon: Icons.settings,
            label: 'Settings',
            index: 3,
            isActive: widget.selectedIndex == 3,
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
      onTap: () => widget.onBottomNavTap?.call(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive
                  ? const Color(0xFF3B82F6)
                  : const Color(0xFF9CA3AF), // blue-500 : gray-400
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive
                    ? const Color(0xFF3B82F6)
                    : const Color(0xFF9CA3AF), // blue-500 : gray-400
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

  Widget _buildStickySearchBar() {
    return Container(
      width: _isSearchExpanded ? null : 100.0,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: _isSearchExpanded ? 56 : 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_isSearchExpanded ? 16 : 24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.15),
              Colors.white.withOpacity(0.05),
            ],
          ),
          border: Border.all(
            color: Colors.white.withOpacity(0.25),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_isSearchExpanded ? 16 : 24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Stack(
              children: [
                // Collapsed state - centered search icon
                if (!_isSearchExpanded)
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: _toggleSearch,
                      child: Center(
                        child: Icon(
                          Icons.search,
                          color: Colors.white.withOpacity(0.8),
                          size: 24,
                        ),
                      ),
                    ),
                  ),

                // Expanded state - full search interface
                if (_isSearchExpanded)
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        children: [
                          // Text field
                          Positioned.fill(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.white.withOpacity(0.8),
                                  size: 22,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextField(
                                    controller: _searchController,
                                    onChanged: _onSearchChanged,
                                    autofocus: true,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Search cards...',
                                      hintStyle: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 17,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                              ],
                            ),
                          ),

                          // Clear button (if text exists)
                          if (_searchQuery.isNotEmpty)
                            Positioned(
                              right: 48,
                              top: 0,
                              bottom: 0,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    _searchController.clear();
                                    _onSearchChanged('');
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.clear,
                                      color: Colors.white.withOpacity(0.8),
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          // Close button
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: GestureDetector(
                                onTap: _toggleSearch,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white.withOpacity(0.8),
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
