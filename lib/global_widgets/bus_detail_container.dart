import 'package:flutter/material.dart';
import 'package:fyp/global_widgets/fyp_text.dart';
import 'package:fyp/global_widgets/text_Rows.dart';
import 'package:fyp/utils/constants.dart';

class BusDetailContainer extends StatelessWidget {
  const BusDetailContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 280,
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Center(child: FypText(text: "Student (Combine)",color: primaryColor,fontWeight: FontWeight.bold,fontSize: 14,)),
                Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.star_border_rounded,color: Colors.black,)),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(child: FypText(text: "18",color: Colors.black,fontSize: 21,fontWeight: FontWeight.bold,)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textContainer(text: "UOG",),
                Image.asset(FypIcons.doubleArrowHorizontal,height: 30,),
                textContainer(text: "Gujrat"),
              ],
            ),
            SizedBox(height: 10,),
            textRows(
              busNumber: "GTJ - 1018",
              driverName: "XYZ",
              driverContact: "0383-5565151",
            )
          ],

        ),
      ),
    );
  }
}


class textContainer extends StatelessWidget {
  textContainer({
    super.key,
    required this.text,
  });

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 110,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: FypText(text: text,
          fontSize: 15,
        ),
      ),
    );
  }
}
