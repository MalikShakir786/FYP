import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

AnimatedSnackBar showToast(String message) {
  return AnimatedSnackBar(
      builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            message,
            style: TextStyle(
                fontSize: 15,
                color: Colors.white
            ),
          ),
        );
      },
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      duration: Duration(seconds: 4)
  );
}