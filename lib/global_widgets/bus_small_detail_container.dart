import 'package:flutter/material.dart';
import 'package:fyp/core/bus_find/bus_details_screen.dart';
import 'package:fyp/global_widgets/text_Rows.dart';

import '../utils/constants.dart';
import 'fyp_text.dart';

class BusSmallDetailContainer extends StatelessWidget {
  const BusSmallDetailContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> BusDetailsScreen()));
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white
          ),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: FypText(
                    text: "21",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                  child: textRows(
                    firstLeft: "Bus Number :",
                    secondLeft: "Driver Name :",
                    thirdLeft: "Driver Contact :",
                    firstRight: "GTJ - 1018",
                    secondRight: "XYZ",
                    thirdRight: "0383-5565151",
                  )
              ),
              Icon(Icons.star_rounded,color: primaryColor,size: 25,)
            ],
          ),
        ),
      ),
    );
  }
}