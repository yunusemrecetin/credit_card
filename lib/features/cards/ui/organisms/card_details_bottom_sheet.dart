import 'package:flutter/material.dart';

class CardDetailsBottomSheet extends StatelessWidget {
  final Map<String, dynamic> card;
  final ScrollController? scrollController;

  const CardDetailsBottomSheet({
    super.key,
    required this.card,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF191919), // background-dark - same as wallet page
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          // Drag handle
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8),
            child: Center(
              child: Container(
                height: 6,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3), // Same as wallet page
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
          
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              children: [
                const SizedBox(width: 40), // Spacer for centering
                Expanded(
                  child: Text(
                    'Card Details',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Same as wallet page
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2), // Same as wallet page
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white, // Same as wallet page
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Card image
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: card['cardImageUrl'] != null
                    ? DecorationImage(
                        image: NetworkImage(card['cardImageUrl']),
                        fit: BoxFit.cover,
                      )
                    : null,
                gradient: card['cardImageUrl'] == null
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          card['backgroundColor'] ?? const Color(0xFF1E40AF),
                          (card['backgroundColor'] ?? const Color(0xFF1E40AF))
                              .withOpacity(0.8),
                        ],
                      )
                    : null,
              ),
              child: card['cardImageUrl'] == null
                  ? Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                card['cardType'] ?? 'Credit Card',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Icon(
                                Icons.credit_card,
                                color: Colors.white,
                                size: 24,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            '**** **** **** ${card['cardNumber'] ?? '1234'}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                card['holderName'] ?? 'Card Holder',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                card['expiryDate'] ?? '12/25',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : null,
            ),
          ),
          
          // Card Details Form
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              children: [
                // Card Number
                _buildDetailField(
                  label: 'Card Number',
                  value: _formatCardNumber(card['cardNumber'] ?? '1234567898765432'),
                  onCopy: () => _copyToClipboard(context, card['cardNumber'] ?? '1234567898765432'),
                ),
                const SizedBox(height: 16),
                
                // Full Name
                _buildDetailField(
                  label: 'Full Name',
                  value: card['holderName'] ?? 'John Appleseed',
                  onCopy: () => _copyToClipboard(context, card['holderName'] ?? 'John Appleseed'),
                ),
                const SizedBox(height: 16),
                
                // Expires and CVC Row
                Row(
                  children: [
                    Expanded(
                      child: _buildDetailField(
                        label: 'Expires',
                        value: card['expiryDate'] ?? '09/28',
                        onCopy: () => _copyToClipboard(context, card['expiryDate'] ?? '09/28'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildDetailField(
                        label: 'CVC',
                        value: '123', // Default CVC
                        onCopy: () => _copyToClipboard(context, '123'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Footer buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle transaction history
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Transaction History feature coming soon'),
                          backgroundColor: Color(0xFF191919),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF141414).withOpacity(0.2), // primary/20
                      foregroundColor: Colors.white, // Same as wallet page
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Transaction History',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle manage card
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Manage Card feature coming soon'),
                          backgroundColor: Color(0xFF191919),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF141414), // primary
                      foregroundColor: Colors.white, // Same as wallet page
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Manage Card',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Bottom padding for safe area
          const SizedBox(height: 32),
        ],
        ),
      ),
    );
  }

  Widget _buildDetailField({
    required String label,
    required String value,
    required VoidCallback onCopy,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF141414).withOpacity(0.1), // primary/10
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.6),
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: 'Inter',
                    letterSpacing: label == 'Card Number' ? 2.0 : 0.0,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onCopy,
                child: Icon(
                  Icons.content_copy,
                  size: 16,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatCardNumber(String cardNumber) {
    // Remove any spaces and format as XXXX XXXX XXXX XXXX
    String cleaned = cardNumber.replaceAll(' ', '');
    if (cleaned.length >= 16) {
      return '${cleaned.substring(0, 4)} ${cleaned.substring(4, 8)} ${cleaned.substring(8, 12)} ${cleaned.substring(12, 16)}';
    }
    return cardNumber;
  }

  void _copyToClipboard(BuildContext context, String text) {
    // In a real app, you would use Clipboard.setData(ClipboardData(text: text))
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied: $text'),
        backgroundColor: const Color(0xFF191919),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
