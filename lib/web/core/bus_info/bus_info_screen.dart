import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/global/global_models/bus_model.dart';
import 'package:fyp/utils/constants.dart';
import 'package:provider/provider.dart';
import '../../../global/global_providers/auth_provider.dart';
import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../global/global_widgets/fyp_textfield.dart';
import 'add_bus_info.dart';
import 'edit_bus_info.dart';
import 'package:fyp/global/global_providers/bus_provider.dart';

class BusInfoScreen extends StatefulWidget {
  BusInfoScreen({super.key});

  @override
  State<BusInfoScreen> createState() => _BusInfoScreenState();
}

class _BusInfoScreenState extends State<BusInfoScreen> {
  final List<String> tableLabels = [
    "Bus No.",
    "Bus Plate No.",
    "Driver Name",
    "Driver Contact",
    "Conductor Name",
    "Conductor Contact",
    "Edit",
    "Remove"
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BusProvider>().getBuses(context);
    });
  }

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
                FypText(
                  text: "Bus Information",
                  color: primaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
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
                                text: "Bus Number",
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
                                  text: "Bus Number",
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
                  height: 20,
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
                  height: 20,
                ),
                Consumer<BusProvider>(
                  builder: (context, busProvider, child) {
                    if (busProvider.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return Card(
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
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }),
                            rows: busProvider.busData?.data.map((bus) {
                              return DataRow(cells: [
                                DataCell(FypText(
                                  text: bus.busNo,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                                DataCell(FypText(
                                  text: bus.plateNo,
                                  color: Colors.black,
                                )),
                                DataCell(FypText(
                                  text: bus.driver.driverName,
                                  color: Colors.black,
                                )),
                                DataCell(FypText(
                                  text: bus.driver.driverPhone,
                                  color: Colors.black,
                                )),
                                DataCell(FypText(
                                  text: bus.conductor.conductorName,
                                  color: Colors.black,
                                )),
                                DataCell(FypText(
                                  text: bus.conductor.conductorPhone,
                                  color: Colors.black,
                                )),
                                DataCell(IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    showDialog(
                                      barrierDismissible: false,
                                      barrierColor: Colors.black26,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return EditBusInfo(
                                          bus: bus,
                                        );
                                      },
                                    );
                                  },
                                )),
                                DataCell(IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // Implement delete functionality
                                  },
                                )),
                              ]);
                            }).toList() ?? [],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
