import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/mobile/core/user/edit_profile.dart';

import '../../../global/global_providers/auth_provider.dart';
import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../global/global_widgets/fyp_textfield.dart';
import '../../../utils/constants.dart';
import '../bus_info/add_bus_info.dart';
import '../bus_info/edit_bus_info.dart';
import 'package:provider/provider.dart';

class MainDashboard extends StatelessWidget {
  MainDashboard({super.key});
  

  final List<String> tableLabels = [
    "Bus No.",
    "Bus Plate No.",
    "Type",
    "Route",
    "Start Time",
    "Departure Time",
    "Driver Name",
    "Driver Contact",
    "Conductor Name",
    "Conductor Contact",
    "Scheduling Time"
  ];

  @override
  Widget build(BuildContext context) {
    
    var currentWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: primaryColor,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                FypText(text: "Dashboard",color: primaryColor,fontSize: 17,fontWeight: FontWeight.bold,),
                SizedBox(height: 10,),
                Card(
                  color: Colors.white,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // FypText(text: "User Profile",color: Colors.black,fontWeight: FontWeight.bold,),
                          // SizedBox(height: 10,),
                          Row(
                            children: [
                             ClipOval(
                               child: Image.asset(FypImages.userAvatar,width: 60,height: 60,),
                             ),
                              SizedBox(width: 10,),
                              FypText(text: context.read<AuthProvider>().userData!.userName,
                              color: primaryColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          ),
                          SizedBox(height: 50,),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FypButton(
                              text: "Edit",
                              onTap: () {
                                showDialog(
                                    barrierDismissible: false,
                                    barrierColor: Colors.black26,
                                    context: context, builder: (BuildContext context){
                                  return EditProfile();
                                });
                              },
                              buttonWidth: 100,
                              buttonHeight: 30,
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FypText(
                      text: "Daily Records",
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 10,
                  child: SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: List.generate(tableLabels.length, (index) {
                          return DataColumn(
                            label: FypText(
                              text: tableLabels[index],
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          );
                        }),
                        rows: [
                          // Add your DataRow items here
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
