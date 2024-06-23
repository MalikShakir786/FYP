import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/utils/constants.dart';
import '../../../global/global_providers/auth_provider.dart';
import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../global/global_widgets/fyp_textfield.dart';
import 'add_bus_info.dart';
import 'edit_bus_info.dart';
import 'package:provider/provider.dart';

class BusInfoScreen extends StatelessWidget {
  BusInfoScreen({super.key});

  final List<String> tableLabels = [
    "Bus No.",
    "Bus",
    "Timing",
    "Route",
    "Driver",
    "Conductor",
    "Edit",
    "Remove"
  ];

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

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
                FypText(text: "Bus Information",color: primaryColor,fontSize: 17,fontWeight: FontWeight.bold,),
                SizedBox(height: 10,),
                Card(
                  color: Colors.white,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: currentWidth < 830
                        ? Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    FypText(
                                      text: "Route",
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: FypTextField(
                                        controller: context.read<AuthProvider>().confirmPasswordController,
                                        isLabelShow: false,
                                        fieldHeight: 30,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    FypText(
                                      text: "Category",
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: FypTextField(
                                        controller: context.read<AuthProvider>().confirmPasswordController,
                                        isLabelShow: false,
                                        fieldHeight: 30,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                FypButton(
                                  text: "Search",
                                  onTap: () {},
                                  buttonWidth: 100,
                                  buttonHeight: 30,
                                )
                              ],
                            ),
                        )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      FypText(
                                        text: "Route",
                                        fontWeight: FontWeight.w600,
                                        color: primaryColor,
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                          width: currentWidth * 0.2,
                                          child: FypTextField(
                                            controller: context.read<AuthProvider>().confirmPasswordController,
                                            isLabelShow: false,
                                            fieldHeight: 30,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    children: [
                                      FypText(
                                        text: "Category",
                                        fontWeight: FontWeight.w600,
                                        color: primaryColor,
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                          width: currentWidth * 0.2,
                                          child: FypTextField(
                                            controller: context.read<AuthProvider>().confirmPasswordController,
                                            isLabelShow: false,
                                            fieldHeight: 30,
                                          )),
                                      SizedBox(
                                        width: 20,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              FypButton(
                                text: "Search",
                                onTap: () {
                                  showDialog(
                                      barrierDismissible: false,
                                      barrierColor: Colors.black26,
                                      context: context, builder: (BuildContext context){
                                    return EditBusInfo();
                                  });
                                },
                                buttonWidth: 100,
                                buttonHeight: 30,
                              )
                            ],
                          ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: FypText(
                          text: "Bus Details",
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FypButton(
                        text: "Add New +",
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                              barrierColor: Colors.black26,
                              context: context, builder: (BuildContext context){
                            return AddBusInfo();
                          });
                        },
                        buttonHeight: 30,
                        buttonWidth: 130,
                      )
                    ],
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
