import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../global/global_providers/find_bus_provider.dart';
import '../../../global/global_providers/fav_provider.dart';
import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_navbar.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../global/global_widgets/text_Rows.dart';
import '../../../utils/constants.dart';

class BusDetailsScreen extends StatefulWidget {
  final int id;
  final int busId;

  const BusDetailsScreen({Key? key, required this.id,
    required this.busId
  }) : super(key: key);

  @override
  State<BusDetailsScreen> createState() => _BusDetailsScreenState();
}

class _BusDetailsScreenState extends State<BusDetailsScreen> {
  bool isIconChange = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Check if the bus is already in favorites
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final favProvider = context.read<FavProvider>();
      setState(() {
        isIconChange = favProvider.favBuses.any((bus) => bus.busId == widget.busId.toString());
      });
    });
  }

  Future<void> _toggleFavorite() async {
    final favProvider = context.read<FavProvider>();

    setState(() {
      isLoading = true;
    });

    bool success;
    if (isIconChange) {
      success = await favProvider.delFavs(context, widget.busId);
      print(widget.busId);
    } else {
      success = await favProvider.addFavs(context, widget.busId);
      print(widget.busId);
    }

    if (success) {
      setState(() {
        isIconChange = !isIconChange;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<FindBusProvider>();
    final busDetail = provider.getBusDetailById(widget.id); // Fetch bus details using ID

    if (busDetail == null) {
      return Scaffold(
        body: Center(
          child: FypText(
            text: "Bus details not found!",
            color: Colors.red,
          ),
        ),
      );
    }

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
                    margin: EdgeInsets.only(top: 30), // Adjust margin to position below the number container
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        FypText(
                          text: busDetail.plateNo.toString(),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                        FypText(
                          text: busDetail.status,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        Divider(thickness: 1, height: 25, color: Colors.grey),
                        textRows(
                          firstLeft: "Driver Name :",
                          secondLeft: "Driver Contact :",
                          firstRight: busDetail.driverName,
                          secondRight: busDetail.driverPhoneNo,
                        ),
                        Divider(thickness: 1, height: 25, color: Colors.grey),
                        textRows(
                          firstLeft: "Conductor Name :",
                          secondLeft: "Conductor Contact :",
                          firstRight: busDetail.conductorName ?? "Not Available",
                          secondRight: busDetail.conductorPhoneNo ?? "Not Available",
                        ),
                        Divider(thickness: 1, height: 25, color: Colors.grey),
                        FypText(
                          text: "Route",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                        SizedBox(height: 10),
                        FypText(
                          text: busDetail.via,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        Divider(thickness: 1, height: 25, color: Colors.grey),
                        FypText(
                          text: "Timings",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                        textRows(
                          firstLeft: "Arrival Time :",
                          secondLeft: "Departure Time :",
                          thirdLeft: "Time left to departure :",
                          firstRight: busDetail.startTime,
                          secondRight: busDetail.departureTime,
                          thirdRight: "00:00:00", // This should be calculated
                        ),
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
                          text: busDetail.busNo.toString(),
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
                        border: Border.all(color: Colors.white, width: 5),
                      ),
                      child: Center(
                        child: FypText(
                          text: busDetail.routeName,
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
                        onTap: _toggleFavorite,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: isLoading
                                ? CircularProgressIndicator()
                                : Icon(
                              isIconChange ? Icons.star : Icons.star_border,
                              color: primaryColor,
                            ),
                          ),
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
