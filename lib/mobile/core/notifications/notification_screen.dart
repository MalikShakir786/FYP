import 'package:flutter/material.dart';
import '../../../global/global_providers/bus_provider.dart';
import '../../../global/global_widgets/dropdown_field.dart';
import '../../../global/global_widgets/fyp_navbar.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../global/global_widgets/notification_tile.dart';
import '../../../utils/constants.dart';
import 'package:provider/provider.dart';

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
              child: DropDownField(
                itemList: context.read<BusProvider>().busNumbers,
                controller: context.read<BusProvider>().noController,
                fillColor: primaryColor.withOpacity(0.4),
                hintText: "Bus number",
              ),
            ),
            SizedBox(height: 10,),
            Divider(thickness: 1,height: 0,),
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
