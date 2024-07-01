import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../global/global_widgets/dropdown_field.dart';
import '../../../global/global_widgets/fyp_textfield.dart';
import '../../../web/core/timetable/manual_select_route.dart';
import '../../../global/global_models/web_timetabel_model.dart';
import '../../../global/global_providers/timetable_provider.dart';
import '../../../global/global_widgets/confirmation_alert.dart';
import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../utils/constants.dart';

class ManualScheduling extends StatefulWidget {
  ManualScheduling({
    super.key,
  });

  @override
  State<ManualScheduling> createState() => _ManualSchedulingState();
}

class _ManualSchedulingState extends State<ManualScheduling> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TimeTableProvider>().getTimetable(context);
      context.read<TimeTableProvider>().sTimeController.text = "07:00:00";
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
    "Remove"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  FypTextField(
                    labelText: "Bus No.",
                    labelColor: Colors.black,
                    hintText: "Bus Number",
                    controller: context.read<TimeTableProvider>().noController,
                  ),
                  SizedBox(height: 10),
                  DropDownField(
                    itemList: context.read<TimeTableProvider>().busTypes,
                    controller: context.read<TimeTableProvider>().statusController,
                    labelText: "Bus Type",
                    labelColor: Colors.black,
                    hintText: "Bus Type",
                  ),
                  SizedBox(height: 10),
                  FypTextField(
                    isDisable: true,
                    labelText: "Starting Time",
                    labelColor: Colors.black,
                    hintText: "Starting Time",
                    controller: context.read<TimeTableProvider>().sTimeController,
                  ),
                  SizedBox(height: 10),
                  DropDownField(
                    itemList: context.read<TimeTableProvider>().busTimings,
                    controller: context.read<TimeTableProvider>().dTimeController,
                    labelText: "Departure Time",
                    labelColor: Colors.black,
                    hintText: "Departure Time",
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ManualSelectRoute()));
                    },
                    child: FypTextField(
                      isDisable: true,
                      labelText: "Route",
                      labelColor: Colors.black,
                      hintText: "Route",
                      controller: context.read<TimeTableProvider>().routeIdController,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: FypButton(
                      isLoading: context.watch<TimeTableProvider>().isEditLoading,
                      text: "Schedule",
                      buttonColor: primaryColor,
                      onTap: () async {
                        await context.read<TimeTableProvider>().createTimetable(context);
                        context.read<TimeTableProvider>().getTimetable(context);
                      },
                    ),
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
                  Consumer<TimeTableProvider>(
                    builder: (context, provider, child) {
                      return provider.isLoading
                          ? Center(child: CircularProgressIndicator())
                          : SingleChildScrollView(
                        child: Card(
                          elevation: 10,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: List.generate(tableLabels.length, (index) {
                                return DataColumn(
                                  label: FypText(
                                    text: tableLabels[index],
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }),
                              rows: List.generate(provider.timetables.length, (index) {
                                final timetable = provider.timetables[index];
                                return DataRow(
                                  cells: [
                                    DataCell(FypText(text: timetable.busNo.toString(), color: Colors.black, fontWeight: FontWeight.bold)),
                                    DataCell(FypText(text: timetable.plateNo, color: Colors.black)),
                                    DataCell(FypText(text: timetable.status, color: Colors.black)),
                                    DataCell(FypText(text: timetable.rname, color: Colors.black)),
                                    DataCell(FypText(text: timetable.sTime, color: Colors.black)),
                                    DataCell(FypText(text: timetable.departureTime, color: Colors.black)),
                                    DataCell(FypText(text: timetable.driverName, color: Colors.black)),
                                    DataCell(FypText(text: timetable.driverPhoneNo, color: Colors.black)),
                                    DataCell(FypText(text: timetable.conductorName, color: Colors.black)),
                                    DataCell(FypText(text: timetable.conductorPhoneNo, color: Colors.black)),
                                    DataCell(FypText(text: timetable.departureTime, color: Colors.black)),
                                    DataCell(
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          showDialog(
                                            barrierDismissible: false,
                                            barrierColor: Colors.black26,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return ConfirmationAlert(
                                                isLoading: context.watch<TimeTableProvider>().isDelLoading,
                                                title: "Delete?",
                                                subTitle: "Do you want to delete this bus?",
                                                onTap: () async {
                                                  await context.read<TimeTableProvider>().removeTimetable(context, timetable.id);
                                                  Navigator.pop(context);
                                                  context.read<TimeTableProvider>().getTimetable(context);
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
