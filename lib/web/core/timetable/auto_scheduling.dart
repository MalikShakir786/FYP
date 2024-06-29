import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fyp/global/global_widgets/dropdown_field.dart';
import 'package:fyp/web/core/timetable/timetable_widgets/routes_saver.dart';
import 'package:fyp/global/global_providers/timetable_provider.dart';
import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../utils/constants.dart';

class AutoScheduling extends StatefulWidget {
  AutoScheduling({super.key});

  @override
  State<AutoScheduling> createState() => _AutoSchedulingState();
}

class _AutoSchedulingState extends State<AutoScheduling> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TimeTableProvider>().getTimetable(context);
    });
  }

  final List<String> tableLabels = [
    "Bus No.",
    "Bus Plate No.",
    "Type",
    "Route",
    "Start Time",
    "Departure Time",
    "Driver Name",
    "Driver Contact",
    "Conductor Name",
    "Conductor Contact",
    "Scheduling Time",
    "Edit",
    "Remove"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropDownField(
            labelText: "Scheduling Time",
            labelColor: Colors.black,
            itemList: context.read<TimeTableProvider>().busTimings,
            controller: context.read<TimeTableProvider>().timingController,
          ),
          DropDownField(
            labelText: "Scheduling Route",
            labelColor: Colors.black,
            itemList: context.read<TimeTableProvider>().busRoute,
            controller: context.read<TimeTableProvider>().routeController,
            onChange: (value) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.read<TimeTableProvider>().addRoute(value, context);
              });
            },
          ),
          SizedBox(height: 20),
          Consumer<TimeTableProvider>(
            builder: (context, provider, child) {
              return RouteSaver(routes: provider.routesList);
            },
          ),
          SizedBox(height: 20,),
          Center(
            child: FypButton(text: "Schedule", buttonColor: primaryColor, onTap: () {
              context.read<TimeTableProvider>().getTimetable(context);
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: FypText(
                text: "Recent Schedulings",
                color: primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Consumer<TimeTableProvider>(
              builder: (context, provider, child) {
                return provider.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Card(
                  elevation: 10,
                  child: SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: tableLabels.map((label) {
                          return DataColumn(
                            label: FypText(
                              text: label,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          );
                        }).toList(),
                        rows: provider.timetables.map((timetable) {
                          return DataRow(cells: [
                            DataCell(FypText(text: timetable.busNo.toString(),color: Colors.black,)),
                            DataCell(FypText(text: timetable.plateNo)),
                            DataCell(FypText(text: timetable.status)),
                            DataCell(FypText(text: timetable.routeName)),
                            DataCell(FypText(text: timetable.startTime)),
                            DataCell(FypText(text: timetable.departureTime)),
                            DataCell(FypText(text: timetable.driverName)),
                            DataCell(FypText(text: timetable.driverPhoneNo)),
                            DataCell(FypText(text: timetable.conductorName)),
                            DataCell(FypText(text: timetable.conductorPhoneNo)),
                            DataCell(FypText(text: timetable.departureTime)),
                            DataCell(IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Edit functionality
                              },
                            )),
                            DataCell(IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                // Remove functionality
                              },
                            )),
                          ]);
                        }).toList(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
