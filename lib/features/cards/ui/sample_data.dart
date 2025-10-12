// Sample data for the HTML-style wallet cards
// This demonstrates how to use the new wallet design

import 'dart:ui';

List<Map<String, dynamic>> sampleWalletCards = [
  {
    'day': 'TUE',
    'date': '28',
    'cardType': 'credit',
    'backgroundColor': const Color(0xFF1E40AF), // blue-800
    'content': 'credit_card',
    'cardNumber': '1234',
    'hasNFC': true,
    'cardImageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDOnQDnJG8WgXX0wY7lgLhBQ4yMRTZOSIbbs5ZrDc87S0IPavjDARHmaP2KzQZSXyHCp3zStsg-yilK2eGjpyZg4ZyJYm5NzJgffaA9D13KUhpJ9tlKy35mhmbxtudcc6ymKJO6LgprZBvON6Umcnk4js0Ya9-7BP4a5KWc-ChoJK1UOiw265HekPCS9sEj2J4ynGDTVWZlw4F4E4k4055xtsh-J7nWOj05HIRHZYewcDKjxOR7eWJMqXnc_wq_M2RjG_nr2bV_7Tat',
  },
  {
    'day': 'MON',
    'date': '27',
    'cardType': 'credit',
    'backgroundColor': const Color(0xFF059669), // emerald-600
    'content': 'credit_card',
    'cardNumber': '5678',
    'hasNFC': true,
    'cardImageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCJEcmNsd3TuQSeR92RJQEj2zlCnswyeuvl3AqaX4YrdDmCH6D10SVj85d_x0FFstahtVb_2I-vgB3T_c0bdX6jMaYxAnIm4D7EOrT8dJWBtQay8WnG9rYc8HaylDfPKcNE64qQ1KrNdqfvwQffKJ0Y_t7Z96kThqg4c9_8xA3w1bv08aC7SgNAWEA-QZdw87aaKyHWyE6b-gpKUykWiycNw3R2qclvESWvolEbxzZQg9i6Fh16HHORQnQg7TBD3R54zPxTtPgWrthX',
  },
  {
    'day': 'SUN',
    'date': '26',
    'cardType': 'credit',
    'backgroundColor': const Color(0xFFDC2626), // red-600
    'content': 'credit_card',
    'cardNumber': '9012',
    'hasNFC': true,
    'cardImageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBuLqXfSaawImxN3BClKj1OePLU3eqQQB6hLFDlypt74O3Wu3a_jg53XEkLSDym4RYZZiilEPblLSq7NvSP8bl-XyofKwVTiLDmdgLqFSBw6HTkEw3OXCnl1AZV0kAFKSmUXKFTcSFjnZXDYgn5Rqf9JirROrU_EFfWnJgen_ItYmlNa0OYtKkIJkp0PWCcMhyUgxp3aonOTJpQLg_RH97jqi0-hIAy9GiQKAoT6sd6erYH5tXAl3u12QolT1Wa5HQv8aNtJnCLm3KD',
  },
  {
    'day': 'SAT',
    'date': '25',
    'cardType': 'credit',
    'backgroundColor': const Color(0xFF7C3AED), // violet-600
    'content': 'credit_card',
    'cardNumber': '3456',
    'hasNFC': true,
    'cardImageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDTYltfpuWeT4P57v_qow0XH5vWBvtQ0eqib4DvakDdiOMgUcvWXvIiIJMaLGu7ykEnb0xuWaoUSje1Q52xpXmpHF0oeYdavGf_D0fLKGVkILtxRAHuYYFhX7XxqqKOTcRtslBDV4m73jWdK-1RvJKyolO3xnlHjJbN_CKeHmxrIlJ3ksHNe9NYFll1ObGlkkTr6bLix6JSmkVLnBn2g0Ul80r7phGX3nSQr1FHqSNrdnUftLH6qqlaay24I0oba2GHkEF7_IVVDcqN',
  },
  {
    'day': 'FRI',
    'date': '24',
    'cardType': 'credit',
    'backgroundColor': const Color(0xFFEA580C), // orange-600
    'content': 'credit_card',
    'cardNumber': '7890',
    'hasNFC': true,
    'cardImageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDVRQ0dOvaVSKvmkqxp5yj3LAS7Ll4TUcLebVkx1jpiN79KRzDaPL71aI72LrUN9gDclBoDRb0QYx69WRMn1kJeY1QV0SG3GnJ_Owck5bkt7NvFkVAP1pUYq_QNtvF03iijSw3rf6Ch2Ec693Cecam_W2BMjuwPceW0QzgBb8LLuJG55AKvxY5r0taTY7lbbYIDeVJh1DLbpPZ0P2dMqsCerBt4SyoduvsQInf6GvcACR-plYxZlvZTsfhYKJBWjB0ITLzHVc0fTzuc',
  },
  {
    'day': 'THU',
    'date': '23',
    'cardType': 'credit',
    'backgroundColor': const Color(0xFFEAB308), // yellow-500
    'content': 'credit_card',
    'cardNumber': '4321',
    'hasNFC': true,
    // This card uses gradient instead of image (like the last card in HTML)
  },
];

// Usage example:
// WalletPageTemplate(
//   selectedIndex: 0,
//   walletCards: sampleWalletCards,
//   onCardTap: (card) => print('Card tapped: ${card['cardNumber']}'),
//   onSortCards: () => print('Sort cards'),
//   onAddCard: () => print('Add new card'),
//   onBottomNavTap: (index) => print('Navigate to: $index'),
// )
