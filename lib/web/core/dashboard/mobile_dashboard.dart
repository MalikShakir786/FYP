import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/web/core/dashboard/main_dashboard.dart';
import 'package:fyp/web/core/feedback/feedback_screen.dart';
import 'package:fyp/web/core/timetable/timetable_screen.dart';
import 'package:fyp/web/core/route/routes_screen.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../mobile/core/user/edit_profile.dart';
import '../../../utils/constants.dart';
import '../bus_info/bus_info_screen.dart';
import '../users/user_screen.dart';

class MobileDashBoard extends StatefulWidget {
  MobileDashBoard({super.key});

  @override
  _MobileDashBoardState createState() => _MobileDashBoardState();
}

class _MobileDashBoardState extends State<MobileDashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;

  final List<String> menuItems = [
    "Dashboard",
    "Bus Information",
    "Time Table",
    "Feedback",
    "Users",
    "Routes"
  ];
  final List<String> menuIcons = [
    FypIcons.dashBoard,
    FypIcons.bus,
    FypIcons.timeTable,
    FypIcons.feedback,
    FypIcons.users,
    FypIcons.busStop
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Drawer(
            width: 250,
            backgroundColor: primaryColor,
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return Tooltip(
                  message: menuItems[index],
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListTile(
                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (selectedIndex == index)
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white
                            ),
                          ),
                        Image.asset(
                          menuIcons[index],
                          color: selectedIndex == index ? primaryColor : Colors.white,
                          width: 20,height: 20,
                        ),
                      ],
                    ),
                    title: FypText(
                      text: menuItems[index],
                    ),
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      Navigator.pop(context);  // Close the drawer
                    },
                  ),
                );
              },
            ),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: selectedIndex == 0? MainDashboard():
              selectedIndex == 1? BusInfoScreen():
              selectedIndex == 2? TimeTableScreen():
              selectedIndex == 3? FeedBackScreen():
              selectedIndex == 4? UsersScreen(): RoutesScreen(),
            ),
            Container(
              color: primaryColor,
              height: 80,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: Icon(Icons.menu, color: Colors.white),
                    ),
                    SizedBox(width: 5,),
                    Spacer(),
                    Image.asset(FypImages.logoDesktop,
                      width: MediaQuery.of(context).size.width*0.4,
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              icon: Row(
                                children: [
                                  Image.asset(FypImages.userAvatar),
                                  SizedBox(width: 5),
                                  Icon(Icons.arrow_drop_down, color: Colors.white),
                                ],
                              ),
                              items: [
                                DropdownMenuItem<String>(
                                  value: 'Dashboard',
                                  child: FypText(
                                    text: 'Dashboard',
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Edit Profile',
                                  child: FypText(
                                    text: 'Edit Profile',
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                if (value == 'Dashboard') {
                                  // Navigate to Dashboard
                                  setState(() {
                                    selectedIndex = 0;
                                  });
                                } else if (value == 'Edit Profile') {
                                  // Navigate to Edit Profile
                                  showDialog(
                                      barrierDismissible: false,
                                      barrierColor: Colors.black26,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return EditProfile();
                                      });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
