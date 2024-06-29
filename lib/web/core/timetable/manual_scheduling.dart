import 'package:flutter/material.dart';

import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../utils/constants.dart';

class ManualScheduling extends StatelessWidget {
  ManualScheduling({
    super.key,
  });

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
          FypText(
            text: 'Manual Scheduling Settings',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          SizedBox(height: 10),
          FypText(
            text: 'Manually set the schedule below:',
            color: Colors.black,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Date',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Time',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: FypText(
              text: 'Apply Manual Scheduling',
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: FypButton(text: "Schedule",buttonColor: primaryColor,onTap: (){

            },),
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
    );
  }
}