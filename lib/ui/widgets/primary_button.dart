import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color foregroundColor;
  final EdgeInsets padding;
  final EdgeInsets contentPadding;
  final double borderRadius;
  final double elevation;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width = double.infinity,
    this.height = 80.0,
    this.backgroundColor = Colors.deepPurple,
    this.foregroundColor = Colors.white,
    this.padding = const EdgeInsets.all(12.0),
    this.contentPadding = const EdgeInsets.symmetric(vertical: 18),
    this.borderRadius = 30,
    this.elevation = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: contentPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: elevation,
        ),
        child: child,
      ),
    );
  }
}
