import 'package:flutter/material.dart';
import 'highlighted_text.dart';

class PreviewBox extends StatelessWidget {
  final String text;
  final Color hashtagColor;
  final double fontSize;

  const PreviewBox({
    super.key,
    required this.text,
    this.hashtagColor = Colors.blue,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: HighlightedText(
        text: text,
        hashtagColor: hashtagColor,
        fontSize: fontSize,
      ),
    );
  }
}
