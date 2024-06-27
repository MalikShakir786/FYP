import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fyp/global/global_widgets/dropdown_field.dart';
import 'package:fyp/web/core/timetable/timetable_widgets/routes_saver.dart';
import 'package:fyp/global/global_providers/timetable_provider.dart';

class AutoScheduling extends StatelessWidget {
  const AutoScheduling({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropDownField(
            labelText: "Scheduling Time",
            labelColor: Colors.black,
            itemList: context.read<TimeTableProvider>().busTimings,
            controller: context.read<TimeTableProvider>().timingController,
          ),
          DropDownField(
            labelText: "Scheduling Route",
            labelColor: Colors.black,
            itemList: context.read<TimeTableProvider>().busRoute,
            controller: context.read<TimeTableProvider>().routeController,
            onChange: (value) {
              context.read<TimeTableProvider>().addRoute(value,context);
            },
          ),
          SizedBox(height: 20),
          Consumer<TimeTableProvider>(
            builder: (context, provider, child) {
              return Expanded(child: SingleChildScrollView(child: RouteSaver(routes: provider.routesList)));
            },
          ),
        ],
      ),
    );
  }
}
