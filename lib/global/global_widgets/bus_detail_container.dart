import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/global/global_widgets/dynamic_text.dart';
import 'package:fyp/global/global_widgets/text_Rows.dart';
import '../../mobile/core/bus_find/bus_details_screen.dart';
import '../../utils/constants.dart';
import 'fyp_text.dart';
import '../../mobile/core/lists/fav_detail.dart';  // Import the FavDetail screen

class BusDetailContainer extends StatelessWidget {
  final Icon starIcon;  // Change type to Icon
  final int busNo;
  final String route;
  final String type;
  final String noPlate;
  final String driverName;
  final String driverContact;
  final int id;
  final int busId;
  final String screen;
  final String? conductorName;
  final String? conductorContact;

  BusDetailContainer({
    Key? key,
    required this.starIcon,  // Update type to Icon
    required this.type,
    required this.driverContact,
    required this.driverName,
    required this.busNo,
    required this.noPlate,
    required this.route,
    required this.id,
    required this.busId,
    required this.screen,
    this.conductorName,
    this.conductorContact,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(busId);
        if (screen == 'find') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BusDetailsScreen(id: id,busId: busId),
            ),
          );
        } else if (screen == 'fav') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavDetail(
                id: id,
                busNo: busNo,
                route: route,
                type: type,
                noPlate: noPlate,
                driverName: driverName,
                driverContact: driverContact,
                conductorName: conductorName,
                conductorContact: conductorContact,
              ),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              margin: EdgeInsets.only(top: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Center(
                    child: FypText(
                      text: type,
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
                    firstRight: noPlate,
                    secondRight: driverName,
                    thirdRight: driverContact,
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
                    width: 5,
                  ),
                ),
                child: Center(
                  child: FypText(
                    text: busNo.toString(),
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
                    width: 5,
                  ),
                ),
                child: Center(
                  child: DynamicText(
                    text: route,
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
                  child: Center(child: starIcon),  // Use the provided starIcon directly
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

