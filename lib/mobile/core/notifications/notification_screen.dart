import 'package:flutter/material.dart';
import 'package:fyp/global/global_widgets/fyp_textfield.dart';
import 'package:provider/provider.dart';
import 'package:fyp/global/global_providers/notification_provider.dart';
import '../../../global/global_providers/bus_provider.dart';
import '../../../global/global_widgets/dropdown_field.dart';
import '../../../global/global_widgets/fyp_navbar.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../global/global_widgets/notification_tile.dart';
import '../../../utils/constants.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotificationProvider>().getNotifications(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FypNavBar(title: "Notifications"),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FypTextField(
                controller: context.read<NotificationProvider>().searchController,
                labelText: "Bus No.",
                labelColor: Colors.black,
                hintText: "Bus Number",
                fieldHeight: 30,
                onChange: (value) {
                  if(context.read<NotificationProvider>().searchController.text.isEmpty){
                    Future.delayed(Duration(milliseconds: 1000), () {
                      setState(() {
                        context.read<NotificationProvider>().getNotifications(context);
                      });
                    });
                  }else{
                    Future.delayed(Duration(milliseconds: 1000), () {
                      setState(() {
                        context.read<NotificationProvider>().searchNotifications(context);
                      });
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FypText(
                      text: "Recent Notifications:",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    Expanded(
                      child: Consumer<NotificationProvider>(
                        builder: (context, notificationProvider, child) {
                          if (notificationProvider.isLoading) {
                            return Center(child: CircularProgressIndicator(color: Colors.white,));
                          } else if (notificationProvider.notifications.isEmpty) {
                            return Center(child: FypText(text: "No notifications available",));
                          } else {
                            return ListView.builder(
                              itemCount: notificationProvider.notifications.length,
                              itemBuilder: (context, index) {
                                return NotificationTile(
                                  notification: notificationProvider.notifications[index],
                                );
                              },
                            );
                          }
                        },
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
