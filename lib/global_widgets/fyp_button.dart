import 'package:flutter/material.dart';
import 'package:fyp/global_widgets/fyp_text.dart';
import 'package:fyp/utils/constants.dart';

class FypButton extends StatelessWidget {
  FypButton({
    super.key,
    required this.text,
    this.buttonColor = Colors.black,
    required this.onTap,
  });

  final String text;
  final Color buttonColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )
          ),
          child: FypText(
            text: text,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          )),
    );
  }
}
