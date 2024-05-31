import 'package:flutter/material.dart';


import '../../../utils/constants.dart';
import '../../global_widgets/fyp_button.dart';
import '../../global_widgets/fyp_navbar.dart';
import '../../global_widgets/fyp_text.dart';
import '../../global_widgets/text_Rows.dart';

class BusDetailsScreen extends StatelessWidget {
  const BusDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FypNavBar(title: "Bus Details"),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.star_rounded,
                          color: primaryColor,
                        )),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: FypText(
                        text: "18",
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                    SizedBox(height: 10,),
                    FypText(text: "GRT - 1018",
                    fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                    Divider(thickness:2,
                    color: Colors.black38),
                    textRows(
                      firstLeft: "Driver Name :",
                      secondLeft: "Driver Contact :",
                      thirdLeft: "Type :",
                      firstRight: "XYZ",
                      secondRight: "0383-5565151",
                      thirdRight: "Student (Combine)",
                    ),
                    Divider(thickness:2,
                        color: Colors.black38),
                    FypText(text: "Route",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                    SizedBox(height: 10,),
                    FypText(text: "University - Khokha stop - Fatehpur - Daulat Nagar - Nassera - Kharian",
                    color: Colors.black,
                    ),
                    Divider(thickness:2,
                        color: Colors.black38),
                    FypText(text: "Timings",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                    textRows(
                      firstLeft: "Arrival Time :",
                      secondLeft: "Departure Time :",
                      thirdLeft: "Time left to departure :",
                      firstRight: "10:41",
                      secondRight: "16:30",
                      thirdRight: "00:00:00",
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            FypButton(text: "Done", onTap: (){
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}
