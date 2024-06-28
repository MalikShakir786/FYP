import 'package:flutter/material.dart';
import 'package:fyp/global/global_widgets/fyp_text.dart';

class DynamicText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;

  DynamicText({required this.text,
  this.fontWeight = FontWeight.normal,
    this.color = Colors.white
  });

  double calculateFontSize(String text) {
    int length = text.length;
    if (length < 10) {
      return 16.0; // Larger font size for short text
    } else if (length < 20) {
      return 12.0; // Medium font size for medium text
    } else {
      return 8.0; // Smaller font size for long text
    }
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = calculateFontSize(text);

    return FypText(
      text: text,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}