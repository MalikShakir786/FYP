import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'fyp_text.dart';

class textRows extends StatelessWidget {
  textRows({
    super.key,
    required this.busNumber,
    required this.driverName,
    required this.driverContact,
  });

  String busNumber;
  String driverName;
  String driverContact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FypText(text: "Bus Number :",color: Colors.black,fontWeight: FontWeight.bold,),
              FypText(text: busNumber,color: primaryColor,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FypText(text: "Driver Name :",color: Colors.black,fontWeight: FontWeight.bold,),
              FypText(text: driverName,color: primaryColor,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FypText(text: "Driver Contact :",color: Colors.black,fontWeight: FontWeight.bold,),
              FypText(text: driverContact,color: primaryColor,)
            ],
          ),
        ],
      ),
    );
  }
}