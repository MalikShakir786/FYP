import 'package:flutter/material.dart';

import 'fyp_text.dart';


class FypButton extends StatelessWidget {
  FypButton({
    super.key,
    required this.text,
    this.buttonColor = Colors.black,
    required this.onTap,
    this.isDisabled = false,
    this.buttonWidth = 230,
    this.buttonHeight = 45,
  });

  final String text;
  final Color buttonColor;
  final VoidCallback onTap;
  final bool isDisabled;
  final double buttonWidth;
  final double buttonHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
          onPressed: isDisabled? (){}:onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: isDisabled? buttonColor.withOpacity(0.3):buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )
          ),
          child: FypText(
            text: text,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          )),
    );
  }
}
