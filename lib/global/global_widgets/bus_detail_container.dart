import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/global/global_widgets/text_Rows.dart';
import '../../mobile/core/bus_find/bus_details_screen.dart';
import '../../utils/constants.dart';
import 'fyp_text.dart';

class BusDetailContainer extends StatelessWidget {
  BusDetailContainer({
    super.key,
    required this.starIcon,
  });

  final Icon starIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BusDetailsScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              margin: EdgeInsets.only(top: 30), // Adjust margin to position below the number container
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Center(
                    child: FypText(
                      text: "Student (Combine)",
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),
                  textRows(
                    firstLeft: "Bus Number :",
                    secondLeft: "Driver Name :",
                    thirdLeft: "Driver Contact :",
                    firstRight: "GTJ - 1018",
                    secondRight: "XYZ",
                    thirdRight: "0383-5565151",
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white,
                      width: 5
                    )
                  ),
                  child: Center(
                    child: FypText(
                      text: "18",
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: Colors.white,
                        width: 5
                    )
                ),
                child: Center(
                  child: FypText(
                    text: "Gujrat",
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(child: starIcon),
                ),
              ),
            ),
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

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 110,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: primaryColor,
          width: 2,
        ),
      ),
      child: Center(
        child: FypText(
          text: text,
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
  }
}
