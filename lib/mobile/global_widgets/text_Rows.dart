import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'fyp_text.dart';

class textRows extends StatelessWidget {
  textRows({
    super.key,
    required this.firstLeft,
    required this.firstRight,
    required this.secondLeft,
    required this.secondRight,
    this.thirdLeft,
    this.thirdRight,
  });

  String firstLeft;
  String secondLeft;
  String? thirdLeft;
  String firstRight;
  String secondRight;
  String? thirdRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FypText(text: firstLeft,color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12,),
              FypText(text: firstRight,color: primaryColor,fontSize: 12,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FypText(text: secondLeft,color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12,),
              FypText(text: secondRight,color: primaryColor,fontSize: 12,)
            ],
          ),
          if(thirdLeft != null && thirdRight != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FypText(text: thirdLeft??"",color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12,),
              FypText(text: thirdRight??"",color: primaryColor,fontSize: 12,)
            ],
          ),
        ],
      ),
    );
  }
}