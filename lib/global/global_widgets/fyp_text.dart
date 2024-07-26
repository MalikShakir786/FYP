import 'package:flutter/material.dart';

class FypText extends StatelessWidget {
  FypText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.color = Colors.white,
    this.textAlign = null,
    this.maxLines = null,
    this.fontStyle = FontStyle.normal,
    this.textDecoration = TextDecoration.none,
    this.decorationColor = Colors.white,
    this.overflow
  });

  String text;
  double fontSize;
  FontWeight fontWeight;
  Color color;
  TextAlign? textAlign;
  int? maxLines;
  FontStyle fontStyle;
  TextDecoration textDecoration;
  Color decorationColor;
  TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: textDecoration,
        decorationColor: decorationColor,
        overflow: overflow
      ),
    );
  }
}