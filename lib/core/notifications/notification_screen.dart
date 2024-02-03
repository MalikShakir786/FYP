import 'package:flutter/material.dart';
import 'package:fyp/global_widgets/fyp_navbar.dart';
import 'package:fyp/global_widgets/fyp_search_bar.dart';
import 'package:fyp/global_widgets/notification_tile.dart';

import '../../global_widgets/fyp_text.dart';
import '../../utils/constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FypNavBar(title: "Notifications"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FypSearchBar(),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 30,left: 30,right: 30),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FypText(text: "Recent Notifications :",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context,index){
                        return NotificationTile();
                      }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
