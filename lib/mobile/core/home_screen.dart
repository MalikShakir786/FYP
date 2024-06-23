import 'package:flutter/material.dart';
import 'package:fyp/mobile/core/lists/fav_bus_list.dart';
import 'package:fyp/mobile/core/user/profile_screen.dart';
import '../../../utils/constants.dart';
import '../../global/global_widgets/fyp_text.dart';
import 'bus_find/find_bus_screen.dart';
import 'notifications/notification_screen.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    FindBusScreen(),
    FavBusList(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildIcon(IconData icon, int index, String label) {
    bool isSelected = _selectedIndex == index;
    return Column(
      children: [
        Container(
          decoration: isSelected
              ? BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          )
              : null,
          padding: isSelected ? EdgeInsets.all(6) : null, // Adjust the padding as needed
          child: Icon(
            icon,
            size: isSelected ? 30 : 24,
            color: isSelected ? primaryColor : Colors.white,
          ),
        ),
        FypText(text: label,
        fontSize: isSelected? 12:10,
          fontWeight: isSelected? FontWeight.bold:FontWeight.normal,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.directions_bus,0,"Find Bus"),
              label: "Find Bus"
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.favorite, 1, "Favorites"),
              label: "Favorites"
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.notifications, 2, "Notifications"),
              label: "Notifications"
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.person, 3, "Profile"),
              label: "Profile"
            ),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: primaryColor,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
      ),
    );
  }
}

