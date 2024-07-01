import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/global/global_providers/auth_provider.dart';
import 'package:fyp/global/global_providers/route_provider.dart';
import 'package:fyp/global/global_providers/timetable_provider.dart';
import 'package:fyp/global/global_widgets/dropdown_field.dart';
import 'package:fyp/global/global_widgets/fyp_navbar.dart';
import 'package:fyp/global/global_widgets/fyp_text.dart';
import 'package:fyp/global/global_widgets/toast_message.dart';
import 'package:fyp/web/core/timetable/timetable_widgets/routes_saver.dart';
import 'package:provider/provider.dart';
import '../../../global/global_widgets/confirmation_alert.dart';
import '../../../global/global_widgets/fyp_textfield.dart';
import '../../../utils/constants.dart';
import '../route/edit_route.dart';
import '../route/route_widgets/routeContainer.dart';

class SelectType extends StatefulWidget {
  const SelectType({super.key});

  @override
  State<SelectType> createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FypNavBar(title: "Select Types"),
            SizedBox(
              height: 10,
            ),
            FypText(
              text: "Order must be same with routes",
              color: Colors.black,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FypText(
                        text: "Selected Routes",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 150,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: RouteSaver(
                            keys: context.read<TimeTableProvider>().selectedRouteIds.keys.toList(),
                              values: context
                                  .watch<TimeTableProvider>()
                                  .selectedRouteIds
                                  .values
                                  .toList()),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FypText(
                        text: "Selected Types",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 150,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: RouteSaver(
                            keys: context.watch<TimeTableProvider>().selectedTypes.keys.toList(),
                              values: context
                                  .watch<TimeTableProvider>()
                                  .selectedTypes
                                  .values
                                  .toList(),
                            type: "type",
                          ),
                        ),
                      ),
                      DropDownField(
                          itemList: context
                              .read<TimeTableProvider>()
                              .busTypes,
                          controller:
                              context.read<TimeTableProvider>().typeController,
                      labelColor: Colors.black,
                        labelText: "Select Types",
                        onChange: (value){
                            if(context.read<TimeTableProvider>().selectedRouteIds.length > context.read<TimeTableProvider>().count){
                              context.read<TimeTableProvider>().addType(context.read<TimeTableProvider>().count.toString(), context.read<TimeTableProvider>().typeController.text);
                              context.read<TimeTableProvider>().count++;
                            }
                            else{
                              showToast("Only ${context.read<TimeTableProvider>().selectedRouteIds.length} routes are selected").show(context);
                            }
                        },
                      )
                    ],
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
