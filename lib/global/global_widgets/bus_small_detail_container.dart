import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/global/global_widgets/text_Rows.dart';
import '../../mobile/core/bus_find/bus_details_screen.dart';
import '../../utils/constants.dart';
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
        onTap: () {
          // Navigator.push(
              // context, MaterialPageRoute(builder: (context) => BusDetailsScreen()));
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 40,right: 20),
                child: textRows(
                  firstLeft: "Bus Number :",
                  secondLeft: "Driver Name :",
                  thirdLeft: "Driver Contact :",
                  firstRight: "GTJ - 1018",
                  secondRight: "XYZ",
                  thirdRight: "0383-5565151",
                ),
              ),
            ),
            Positioned(
              top: 10,
              bottom: 10,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: primaryColor,
                    width: 5,
                  ),
                ),
                child: Center(
                  child: FypText(
                    text: "21",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 5,
              bottom: 25,
              top: 25,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: primaryColor,
                    width: 5,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.star_rounded,
                    color: primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
