import 'package:flutter/material.dart';
import 'fyp_text.dart';

class FypTextField extends StatelessWidget {
  FypTextField({
    Key? key,
    this.labelText = "",
    this.prefixIcon,
    this.suffixIcon,
    this.suffixText = "",
    this.hintText = "",
    this.isLabelShow = true,
    this.fieldHeight = 40,
    this.labelColor = Colors.white,
    this.hintColor = Colors.grey,
    this.controller,
    this.errorText,
    this.maxLength,
    this.keyboard = TextInputType.text,
    this.fillColor = Colors.white,
    this.onChange,
    this.maxLines = 1,
    this.isDisable = false,
  }) : super(key: key);

  final String labelText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String suffixText;
  final String hintText;
  final bool isLabelShow;
  final double fieldHeight;
  final Color labelColor;
  final Color hintColor;
  final TextEditingController? controller;
  final String? errorText;
  final int? maxLength;
  final TextInputType keyboard;
  final Color fillColor;
  final Function(String)? onChange;
  final int maxLines;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    final baseHeight = 38;
    final errorHeight = errorText != null ? 30.0 : 0.0;
    final calculatedHeight = baseHeight + (maxLines - 1) * 24.0 + errorHeight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isLabelShow)
          Column(
            children: [
              FypText(
                text: labelText,
                fontWeight: FontWeight.w600,
                color: labelColor,
              ),
              SizedBox(height: 10),
            ],
          ),
        SizedBox(
          height: calculatedHeight,
          child: TextField(
            enabled: !isDisable,
            maxLines: maxLines,
            onChanged: onChange,
            maxLength: maxLength,
            controller: controller,
            keyboardType: keyboard,
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              fillColor: fillColor,
              hintText: hintText,
              hintStyle: TextStyle(
                color: hintColor,
              ),
              filled: true,
              errorText: errorText,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              suffixText: suffixText,
              suffixStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
