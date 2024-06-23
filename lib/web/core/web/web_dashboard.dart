import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/mobile/global_widgets/fyp_text.dart';
import 'package:fyp/web/core/bus_info_screen/bus_info_screen.dart';
import 'package:fyp/web/core/dashboard/main_dashboard.dart';
import 'package:fyp/web/core/feedback/feedback_screen.dart';
import 'package:fyp/web/core/timetable/timetable_screen.dart';
import '../../../utils/constants.dart';
import '../users/user_screens/user_screen.dart';

class WebDashBoard extends StatefulWidget {
  WebDashBoard({super.key});

  @override
  _WebDashBoardState createState() => _WebDashBoardState();
}

class _WebDashBoardState extends State<WebDashBoard> {
  int selectedIndex = 0;
  bool isMenuExtended = false;
  bool isMenuVisible = true;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: NavigationRail(
                  backgroundColor: primaryColor,
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  extended: isMenuExtended,
                  indicatorColor: Colors.white,
                  destinations: [
                    buildNavigationRailDestination(
                        FypIcons.dashBoard, "Dashboard", 0),
                    buildNavigationRailDestination(
                        FypIcons.bus, "Bus Information", 1),
                    buildNavigationRailDestination(
                        FypIcons.timeTable, "Time Table", 2),
                    buildNavigationRailDestination(
                        FypIcons.feedback, "Feed Back", 3),
                    buildNavigationRailDestination(FypIcons.users, "Users", 4),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: selectedIndex == 0
                        ? MainDashboard()
                        : selectedIndex == 1
                        ? BusInfoScreen()
                        : selectedIndex == 2
                            ? TimeTableScreen()
                            : selectedIndex == 3
                                ? FeedBackScreen()
                                : UsersScreen(),
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: primaryColor,
            height: 80,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMenuExtended = !isMenuExtended;
                      });
                    },
                    child: Icon(Icons.menu, color: Colors.white),
                  ),
                  Image.asset(FypImages.logoDesktop),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Image.asset(FypImages.userAvatar),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_drop_down, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  NavigationRailDestination buildNavigationRailDestination(
      String icon, String label, int index) {
    return NavigationRailDestination(
      icon: Tooltip(
        message: label,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Image.asset(
          icon,
          color: selectedIndex == index ? primaryColor : Colors.white,
          width: 20,
        ),
      ),
      label: FypText(text: label),
    );
  }
}
