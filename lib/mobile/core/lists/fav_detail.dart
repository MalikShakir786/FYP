import 'package:flutter/material.dart';
import 'package:fyp/global/global_providers/fav_provider.dart';
import 'package:provider/provider.dart';
import '../../../global/global_providers/find_bus_provider.dart';
import '../../../global/global_widgets/confirmation_alert.dart';
import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_navbar.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../global/global_widgets/text_Rows.dart';
import '../../../utils/constants.dart';

class FavDetail extends StatelessWidget {
  final int id;
  final int busNo;
  final String route;
  final String type;
  final String noPlate;
  final String driverName;
  final String driverContact;
  final String? conductorName; // Optional conductor info
  final String? conductorContact; // Optional conductor info

  const FavDetail({
    super.key,
    required this.id,
    required this.busNo,
    required this.route,
    required this.type,
    required this.noPlate,
    required this.driverName,
    required this.driverContact,
    this.conductorName, // Initialize optional conductor info
    this.conductorContact, // Initialize optional conductor info
  });

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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    margin: EdgeInsets.only(top: 30),
                    // Adjust margin to position below the number container
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        FypText(
                          text: noPlate,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                        FypText(
                          text: busNo.toString(),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        Divider(thickness: 1, height: 25, color: Colors.grey),
                        textRows(
                          firstLeft: "Driver Name :",
                          secondLeft: "Driver Contact :",
                          firstRight: driverName,
                          secondRight: driverContact,
                        ),
                        if (conductorName != null &&
                            conductorContact != null) ...[
                          Divider(thickness: 1, height: 25, color: Colors.grey),
                          textRows(
                            firstLeft: "Conductor Name :",
                            secondLeft: "Conductor Contact :",
                            firstRight: conductorName!,
                            secondRight: conductorContact!,
                          ),
                        ],
                        SizedBox(height: 20),
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
                        border: Border.all(color: Colors.white, width: 5),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                            barrierColor: Colors.black26,
                            context: context,
                            builder: (BuildContext context) {
                              return ConfirmationAlert(
                                isLoading: context.read<FavProvider>().isLoading,
                                  title: "Del Favorite?",
                                  subTitle: "Do you want to remove this bus from favorite list?",
                                  onTap: () async{
                                    bool isPop = await context.read<FavProvider>().delFavs(context, id);
                                    if(isPop){
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      context.read<FavProvider>().getFavs(context);
                                    }
                                  });
                            },
                          );
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                              child: Icon(
                            Icons.star_rounded,
                            color: primaryColor,
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            FypButton(
              text: "Done",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
