import 'package:flutter/material.dart';
import 'package:fyp/utils/constants.dart';


class FypSearchBar extends StatelessWidget {
  FypSearchBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Color(0xffD9D9D9),
        hintText: "Search Bus Number . . .",
        hintStyle: TextStyle(
            color: Colors.grey.shade700
        ),
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 11,horizontal: 15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40)
        ),
        prefixIcon: Icon(Icons.search,color: primaryColor,size: 30,),
      ),
    );
  }
}
