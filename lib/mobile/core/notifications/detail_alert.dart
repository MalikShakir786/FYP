import 'package:flutter/material.dart';
import 'package:fyp/global/global_providers/notification_provider.dart';
import 'package:fyp/utils/constants.dart';
import 'package:fyp/global/global_widgets/fyp_button.dart';
import 'package:fyp/global/global_widgets/fyp_text.dart';

import '../../../global/global_models/notification_model.dart';
import 'package:provider/provider.dart';

class DetailAlert extends StatelessWidget {
  final BusNotification notification;

  DetailAlert({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        content: Container(
          height: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    FypIcons.infoIcon,
                    width: 80,
                    height: 80,
                  )
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: FypText(
                  text: notification.plateNo,
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              FypText(
                text:
                "${notification.plateNo} has entered the university at ${notification.createdAt}. You can contact the Driver: ${notification.driverName} by this contact number: ${notification.driverPhoneNo} or the Conductor: ${notification.conductorName} by this contact number: ${notification.conductorPhoneNo}",
                color: Colors.black,
                fontSize: 14,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  context.watch<NotificationProvider>().isDelLoading?
                      CircularProgressIndicator():
                  IconButton(
                    icon: Icon(Icons.delete,color: primaryColor,),
                    onPressed: () async{
                      await context.read<NotificationProvider>().deleteNotifications(context, notification.id);
                      Navigator.pop(context);
                    },
                  ),
                  FypButton(
                    text: "Done",
                    buttonWidth: 100,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
