import 'package:flutter/material.dart';
import 'package:fyp/global/global_widgets/fyp_button.dart';
import 'package:fyp/utils/constants.dart';

import '../../../global/global_widgets/fyp_text.dart';
import 'auto_scheduling.dart';
import 'manual_scheduling.dart';

class TimeTableScreen extends StatelessWidget {
  TimeTableScreen({super.key});

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
    "Scheduling Time"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: FypText(
              text: "TimeTable",
              fontSize: 20,
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(child: FypText(text: 'Auto Scheduling', color: primaryColor)),
              Tab(child: FypText(text: 'Manual Scheduling', color: primaryColor)),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  AutoScheduling(),
                  ManualScheduling(),
                ],
              ),
            ),
            FypButton(text: "Schedule",buttonColor: primaryColor,onTap: (){

            },),
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
            Flexible(
              child: Card(
                elevation: 10,
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: List.generate(tableLabels.length, (index) {
                        return DataColumn(
                          label: FypText(
                            text: tableLabels[index],
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        );
                      }),
                      rows: [
                        // Add your DataRow items here
                      ],
                    ),
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
