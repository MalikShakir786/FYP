import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/global/global_widgets/toast_message.dart';
import 'package:fyp/web/core/timetable/select_routes.dart';
import 'package:fyp/web/core/timetable/select_types.dart';
import 'package:provider/provider.dart';
import 'package:fyp/global/global_widgets/dropdown_field.dart';
import 'package:fyp/web/core/timetable/timetable_widgets/routes_saver.dart';
import 'package:fyp/global/global_providers/timetable_provider.dart';
import '../../../global/global_models/web_timetabel_model.dart';
import '../../../global/global_widgets/confirmation_alert.dart';
import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../utils/constants.dart';

class AutoScheduling extends StatefulWidget {
  AutoScheduling({super.key});

  @override
  State<AutoScheduling> createState() => _AutoSchedulingState();
}

class _AutoSchedulingState extends State<AutoScheduling> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TimeTableProvider>().getTimetable(context);
    });
  }

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
    "Scheduling Time",
    "Remove"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Expanded(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 DropDownField(
                   labelText: "Scheduling Time",
                   labelColor: Colors.black,
                   itemList: context.read<TimeTableProvider>().busTimings,
                   controller: context.read<TimeTableProvider>().timingController,
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Center(
                     child: FypButton(
                       text: "Select Routes ---",
                       buttonWidth: 300,
                       onTap: () {
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context) => SelectRoute()));
                       },
                     )),
                 SizedBox(height: 20),
                 Consumer<TimeTableProvider>(
                   builder: (context, provider, child) {
                     return RouteSaver(
                       keys: context
                           .read<TimeTableProvider>()
                           .selectedRouteIds
                           .keys
                           .toList(),
                       values: provider.selectedRouteIds.values.toList(),
                     );
                   },
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Center(
                     child: FypButton(
                       text: "Select Types ---",
                       buttonWidth: 300,
                       onTap: () {
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context) => SelectType()));
                       },
                     )),
                 SizedBox(height: 20),
                 Consumer<TimeTableProvider>(
                   builder: (context, provider, child) {
                     return RouteSaver(
                       keys: context.read<TimeTableProvider>().selectedTypes.keys.toList(),
                       values: provider.selectedTypes.values.toList(),
                       type: "type",
                     );
                   },
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Center(
                   child: FypButton(
                       text: "Schedule",
                       buttonColor: primaryColor,
                       onTap: () async {
                         if (context.read<TimeTableProvider>().selectedRouteIds.length ==
                             context.read<TimeTableProvider>().selectedTypes.length) {
                           context.read<TimeTableProvider>().getTimetable(context);
                         } else {
                           showToast("Routes and Types must be equal!").show(context);
                         }
                       }),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                   child: Align(
                     alignment: Alignment.centerLeft,
                     child: FypText(
                       text: "Recent Schedulings",
                       color: primaryColor,
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
                 Consumer<TimeTableProvider>(
                   builder: (context, provider, child) {
                     return provider.isLoading
                         ? Center(child: CircularProgressIndicator())
                         : Card(
                       elevation: 10,
                       child: SizedBox(
                         width: double.infinity,
                         child: SingleChildScrollView(
                           scrollDirection: Axis.horizontal,
                           child: SingleChildScrollView(
                             scrollDirection: Axis.vertical,
                             child: DataTable(
                               columns: tableLabels.map((label) {
                                 return DataColumn(
                                   label: FypText(
                                     text: label,
                                     color: primaryColor,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 );
                               }).toList(),
                               rows: provider.timetables.map((WebTimetable timetable) {
                                 return DataRow(cells: [
                                   DataCell(FypText(
                                     text: timetable.busNo.toString(),
                                     color: Colors.black,
                                     fontWeight: FontWeight.bold,
                                   )),
                                   DataCell(FypText(text: timetable.plateNo, color: Colors.black)),
                                   DataCell(FypText(text: timetable.status, color: Colors.black)),
                                   DataCell(FypText(text: timetable.rname, color: Colors.black)),
                                   DataCell(FypText(text: timetable.sTime, color: Colors.black)),
                                   DataCell(FypText(text: timetable.departureTime, color: Colors.black)),
                                   DataCell(FypText(text: timetable.driverName, color: Colors.black)),
                                   DataCell(FypText(text: timetable.driverPhoneNo, color: Colors.black)),
                                   DataCell(FypText(text: timetable.conductorName, color: Colors.black)),
                                   DataCell(FypText(text: timetable.conductorPhoneNo, color: Colors.black)),
                                   DataCell(FypText(text: timetable.departureTime, color: Colors.black)),
                                   DataCell(IconButton(
                                     icon: Icon(Icons.delete),
                                     onPressed: () {
                                       showDialog(
                                         barrierDismissible: false,
                                         barrierColor: Colors.black26,
                                         context: context,
                                         builder: (BuildContext context) {
                                           return ConfirmationAlert(
                                               isLoading: context
                                                   .watch<TimeTableProvider>()
                                                   .isDelLoading,
                                               title: "Delete?",
                                               subTitle:
                                               "Do you want to delete this bus?",
                                               onTap: () async{
                                                 await context.read<TimeTableProvider>().removeTimetable(context, timetable.id);
                                                 Navigator.pop(context);
                                                 context.read<TimeTableProvider>().getTimetable(context);
                                               });
                                         },
                                       );
                                     },
                                   )),
                                 ]);
                               }).toList(),
                             ),
                           ),
                         ),
                       ),
                     );
                   },
                 ),
               ],
             ),
           ),
         )
        ],
      ),
    );
  }
}
