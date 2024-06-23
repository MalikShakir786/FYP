import 'package:flutter/material.dart';


import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_navbar.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../global/global_widgets/text_Rows.dart';
import '../../../utils/constants.dart';

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
                            children: [
                              SizedBox(height: 10,),
                              FypText(text: "GRT - 1018",
                              fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                              FypText(text: "Students(Combine)",
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                              Divider(thickness:1,height: 25,color: Colors.grey,),
                              textRows(
                                firstLeft: "Driver Name :",
                                secondLeft: "Driver Contact :",
                                firstRight: "XYZ",
                                secondRight: "0383-5565151",
                              ),
                              Divider(thickness:1,height: 25,color: Colors.grey,),
                              textRows(
                                firstLeft: "Conductor Name :",
                                secondLeft: "Conductor Contact :",
                                firstRight: "XYZ",
                                secondRight: "0383-5565151",
                              ),
                              Divider(thickness:1,height: 25,color: Colors.grey,),
                              FypText(text: "Route",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                              SizedBox(height: 10,),
                              FypText(text: "University - Khokha stop - Fatehpur - Daulat Nagar - Nassera - Kharian",
                              color: Colors.black,
                              ),
                              Divider(thickness:1,height: 25,color: Colors.grey,),
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
                        child: Center(child: Icon(Icons.star)),
                      ),
                    ),
                  ),
                ],
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
