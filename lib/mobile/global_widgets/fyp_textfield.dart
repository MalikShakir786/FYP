import 'package:flutter/material.dart';

import 'fyp_text.dart';


class FypTextField extends StatelessWidget {
  FypTextField({
    super.key,
    this.labelText = "",
    this.prefixIcon = null,
    this.suffixIcon = null,
    this.suffixText = "",
    this.hintText = "",
    this.isLabelShow = true,
    this.fieldHeight = 40,
    this.labelColor = Colors.white
  });

  final String labelText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String suffixText;
  final String hintText;
  final bool isLabelShow;
  final double fieldHeight;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(isLabelShow)
          Column(
            children: [
              FypText(text: labelText,
                fontWeight: FontWeight.w600,
              color: labelColor,
              ),
              SizedBox(height: 10,),
            ],
          ),
        SizedBox(
          height: fieldHeight,
          child: TextField(
            style: TextStyle(
              fontSize: 12
            ),
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey
              ),
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              suffixText: suffixText,
              suffixStyle: TextStyle(
                color: Colors.grey
              )
            ),
          ),
        ),
      ],
    );
  }
}
