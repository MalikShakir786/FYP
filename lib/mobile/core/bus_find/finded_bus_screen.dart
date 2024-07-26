import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/global/global_providers/route_provider.dart';
import 'package:fyp/global/global_providers/timetable_provider.dart';
import 'package:provider/provider.dart';
import '../../../global/global_providers/fav_provider.dart';
import '../../../global/global_providers/find_bus_provider.dart';
import '../../../global/global_widgets/bus_detail_container.dart';
import '../../../global/global_widgets/dropdown_field.dart';
import '../../../global/global_widgets/fyp_navbar.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../utils/constants.dart';

class FindedBusScreen extends StatefulWidget {
  const FindedBusScreen({Key? key}) : super(key: key);

  @override
  State<FindedBusScreen> createState() => _FindedBusScreenState();
}

class _FindedBusScreenState extends State<FindedBusScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FindBusProvider>().timetables.clear();
    context.read<FindBusProvider>().searchTimetable(context);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FindBusProvider>();
    final favProvider = context.watch<FavProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FypNavBar(title: "Finded Bus Details"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  DropDownField(
                    // onTextChange: (x){
                    //   if(context.read<FindBusProvider>().destinationController.text.isEmpty){
                    //     setState(() {
                    //       Future.delayed(Duration(milliseconds: 1000),(){
                    //         context.read<FindBusProvider>().searchTimetable(context);
                    //       });
                    //     });
                    //   }
                    // },
                    itemList: context.read<RouteProvider>().routesList,
                    fillColor: primaryColor.withOpacity(0.4),
                    hintText: "Destination",
                    controller: context.read<FindBusProvider>().destinationController,
                    onChange: (value) {
                      setState(() {
                        context.read<FindBusProvider>().timetables.clear();
                        context.read<FindBusProvider>().searchTimetable(context);
                      });
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DropDownField(
                          // onTextChange: (x){
                          //   if(context.read<FindBusProvider>().noController.text.isEmpty){
                          //     setState(() {
                          //       Future.delayed(Duration(milliseconds: 1000),(){
                          //         context.read<FindBusProvider>().searchTimetable(context);
                          //       });
                          //     });
                          //   }
                          // },
                          itemList: context.read<FindBusProvider>().busNumbers,
                          fillColor: primaryColor.withOpacity(0.4),
                          hintText: "Bus number",
                          controller: context.read<FindBusProvider>().noController,
                          onChange: (value) {
                            setState(() {
                              context.read<FindBusProvider>().timetables.clear();
                              context.read<FindBusProvider>().searchTimetable(context);
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: DropDownField(
                          // onTextChange: (x){
                          //   if(context.read<FindBusProvider>().timeController.text.isEmpty){
                          //     setState(() {
                          //       Future.delayed(Duration(milliseconds: 1000),(){
                          //         context.read<FindBusProvider>().searchTimetable(context);
                          //       });
                          //     });
                          //   }
                          // },
                          itemList: context.read<FindBusProvider>().busTimings,
                          fillColor: primaryColor.withOpacity(0.4),
                          hintText: "Bus time",
                          controller: context.read<FindBusProvider>().timeController,
                          onChange: (value) {
                            setState(() {
                              context.read<FindBusProvider>().timetables.clear();
                              context.read<FindBusProvider>().searchTimetable(context);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(thickness: 1, height: 0),
            Expanded(
              child: provider.isLoading
                  ? Center(
                child: CircularProgressIndicator(color: primaryColor),
              )
                  : provider.timetables.isEmpty
                  ? Center(
                child: FypText(
                  text: "No Buses Available!",
                  color: Colors.black,
                  fontSize: 15,
                ),
              )
                  : SingleChildScrollView(
                child: Column(
                  children: provider.timetables.map((busDetail) {
                    bool isFavorite = favProvider.favBuses
                        .any((favBus) => favBus.busId == busDetail.busId.toString());
                    print(isFavorite);
                    return Column(
                      children: [
                        SizedBox(height: 10),
                        BusDetailContainer(
                          starIcon: isFavorite
                              ? Icon(Icons.star, color: primaryColor)
                              : Icon(Icons.star_border_rounded, color: Colors.black),
                          type: busDetail.status.toUpperCase(),
                          busNo: busDetail.busNo,
                          noPlate: busDetail.plateNo,
                          driverContact: busDetail.driverPhoneNo,
                          driverName: busDetail.driverName,
                          route: busDetail.routeName,
                          id: busDetail.id,
                          busId: busDetail.busId,
                          screen: "find", // Pass the ID
                        ),
                        SizedBox(height: 10),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
