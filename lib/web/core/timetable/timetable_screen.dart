import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/global/global_providers/timetable_provider.dart';
import 'package:fyp/global/global_widgets/fyp_button.dart';
import 'package:fyp/utils/constants.dart';

import '../../../global/global_widgets/fyp_text.dart';
import 'auto_scheduling.dart';
import 'manual_scheduling.dart';
import 'package:provider/provider.dart';

class TimeTableScreen extends StatefulWidget {
  TimeTableScreen({super.key});

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {


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
          ],
        ),
      ),
    );
  }
}
