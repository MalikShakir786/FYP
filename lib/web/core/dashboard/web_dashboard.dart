import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/auth/fyp_login_screen.dart';
import 'package:fyp/web/core/dashboard/main_dashboard.dart';
import 'package:fyp/web/core/feedback/feedback_screen.dart';
import 'package:fyp/web/core/timetable/timetable_screen.dart';
import 'package:fyp/web/core/route/routes_screen.dart'; // Import RoutesScreen
import '../../../global/global_widgets/fyp_text.dart';
import '../../../mobile/core/user/edit_profile.dart';
import '../../../utils/constants.dart';
import '../bus_info/bus_info_screen.dart';
import '../users/user_screen.dart';

class WebDashBoard extends StatefulWidget {
  WebDashBoard({super.key});

  @override
  _WebDashBoardState createState() => _WebDashBoardState();
}

class _WebDashBoardState extends State<WebDashBoard> {
  int selectedIndex = 0;
  bool isMenuExtended = false;

  @override
  Widget build(BuildContext context) {
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
                    buildNavigationRailDestination(FypIcons.dashBoard, "Dashboard", 0),
                    buildNavigationRailDestination(FypIcons.bus, "Bus Information", 1),
                    buildNavigationRailDestination(FypIcons.timeTable, "Time Table", 2),
                    buildNavigationRailDestination(FypIcons.feedback, "Feed Back", 3),
                    buildNavigationRailDestination(FypIcons.users, "Users", 4),
                    buildNavigationRailDestination(FypIcons.busStop, "Routes", 5), // Add Routes
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
                        : selectedIndex == 4
                        ? UsersScreen()
                        : RoutesScreen(), // Handle RoutesScreen
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
                  Image.asset(
                    FypImages.logoDesktop,
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'Dashboard') {
                        setState(() {
                          selectedIndex = 0;
                        });
                      } else if (value == 'Edit Profile') {
                        showDialog(
                            barrierDismissible: false,
                            barrierColor: Colors.black26,
                            context: context,
                            builder: (BuildContext context) {
                              return EditProfile();
                            });
                      }else if(value == "Logout"){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FypLoginScreen()));
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'Dashboard',
                        child: FypText(
                          text: 'Dashboard',
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      PopupMenuItem(
                        value: 'Edit Profile',
                        child: FypText(
                          text: 'Edit Profile',
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      PopupMenuItem(
                        value: 'Logout',
                        child: FypText(
                          text: 'Logout',
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    child: Row(
                      children: [
                        Image.asset(FypImages.userAvatar,height: 40,width: 40,),
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
          height: 20,
          width: 20,
        ),
      ),
      label: FypText(text: label),
    );
  }
}
