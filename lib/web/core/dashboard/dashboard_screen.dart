import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/mobile/global_widgets/fyp_text.dart';
import 'package:fyp/web/core/bus_info_screen/bus_info_screen.dart';
import 'package:fyp/web/core/feedback/feedback_screen.dart';
import 'package:fyp/web/core/mobile/mobile_dashboard.dart';
import 'package:fyp/web/core/timetable/timetable_screen.dart';
import 'package:fyp/web/core/web/web_dashboard.dart';
import '../../../utils/constants.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final currentWidth = MediaQuery.of(context).size.width;

    return currentWidth<=500?MobileDashBoard():WebDashBoard();
  }
}
