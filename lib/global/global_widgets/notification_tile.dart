import 'package:flutter/material.dart';
import 'package:fyp/mobile/core/notifications/detail_alert.dart';
import '../../utils/constants.dart';
import '../global_models/notification_model.dart';
import 'fyp_text.dart';

class NotificationTile extends StatelessWidget {
  final BusInfo notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          barrierDismissible: false,
          barrierColor: Colors.black26,
          context: context,
          builder: (BuildContext context) {
            return DetailAlert(
              notification: notification,
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                title: FypText(
                  text: notification.plateNo,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: primaryColor,
                ),
                subtitle: FypText(
                  text: "${notification.plateNo} has entered the university at ${notification.createdAt}. You can contact the Driver: ${notification.driverName} by this contact number: ${notification.driverPhoneNo}",
                  color: Colors.grey.shade700,
                  fontSize: 13,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Positioned(
              top: 5,
              bottom: 5,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: primaryColor,
                    width: 5,
                  ),
                ),
                child: Center(
                  child: FypText(
                    text: notification.busNo,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 5,
              bottom: 20,
              top: 20,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: primaryColor,
                    width: 5,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.star_rounded,
                    color: primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
