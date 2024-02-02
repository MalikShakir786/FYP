import 'package:flutter/material.dart';
import 'package:fyp/global_widgets/fyp_text.dart';
import 'package:fyp/utils/constants.dart';

class FypTextField extends StatelessWidget {
  FypTextField({
    super.key,
    this.labelText = "",
    this.prefixIcon = null,
    this.suffixIcon = null,
    this.suffixText = "",
    this.hintText = "",
  });

  final String labelText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String suffixText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FypText(text: labelText,
        fontWeight: FontWeight.w600,fontSize: 15,),
        SizedBox(height: 10,),
        TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey
            ),
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 11,horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixText: suffixText,
            suffixStyle: TextStyle(
              color: Colors.grey
            )
          ),
        ),
      ],
    );
  }
}
