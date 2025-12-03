import 'package:flutter/material.dart';

class LargeIconCard extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color iconColor;
  final Color backgroundColor;
  final List<BoxShadow>? shadows;
  final EdgeInsets padding;

  const LargeIconCard({
    super.key,
    required this.icon,
    this.size = 80,
    this.iconColor = Colors.deepPurple,
    this.backgroundColor = Colors.white,
    this.shadows,
    this.padding = const EdgeInsets.all(32),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: shadows ??
            [
              BoxShadow(
                color: Colors.deepPurple.withValues(alpha: 0.3),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
      ),
      child: Icon(
        icon,
        size: size,
        color: iconColor,
      ),
    );
  }
}
