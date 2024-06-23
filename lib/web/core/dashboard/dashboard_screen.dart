import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/web/core/dashboard/web_dashboard.dart';

import 'mobile_dashboard.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final currentWidth = MediaQuery.of(context).size.width;

    return currentWidth<=500?MobileDashBoard():WebDashBoard();
  }
}
