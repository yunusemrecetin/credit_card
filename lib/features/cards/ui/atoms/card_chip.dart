import 'package:flutter/material.dart';

class CardChip extends StatelessWidget {
  final double size;
  final Color color;

  const CardChip({
    super.key,
    this.size = 24.0,
    this.color = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size * 0.7,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.black12, width: 0.5),
      ),
      child: Center(
        child: Container(
          width: size * 0.6,
          height: size * 0.4,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}
