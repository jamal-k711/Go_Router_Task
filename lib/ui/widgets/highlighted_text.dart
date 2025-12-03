import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  final Color hashtagColor;
  final double fontSize;
  final FontWeight fontWeight;

  const HighlightedText({
    super.key,
    required this.text,
    this.hashtagColor = Colors.blue,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    final spans = <TextSpan>[];
    final regex = RegExp(r'(#\w+)');
    final matches = regex.allMatches(text);

    int lastMatchEnd = 0;

    for (final match in matches) {
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: TextStyle(
            color: Colors.black87,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ));
      }

      spans.add(TextSpan(
        text: match.group(0),
        style: TextStyle(
          color: hashtagColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ));

      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastMatchEnd),
        style: TextStyle(
          color: Colors.black87,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ));
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}