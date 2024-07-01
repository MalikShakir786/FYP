import 'package:flutter/material.dart';
import '../../../../global/global_widgets/fyp_text.dart';
import '../../../../utils/constants.dart';
import 'package:provider/provider.dart';
import '../../../../global/global_providers/timetable_provider.dart';

class RouteSaver extends StatefulWidget {
  RouteSaver({Key? key, required this.keys, required this.values, this.type = "route"});

  final List<String> keys;
  final List<String> values;
  final String type;

  @override
  State<RouteSaver> createState() => _RouteSaverState();
}

class _RouteSaverState extends State<RouteSaver> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(widget.values.length, (index) {
        String key = widget.keys[index];
        String value = widget.values[index];

        return Stack(
          alignment: Alignment.centerRight,
          children: [
            GestureDetector(
              onTap: () {
                // Handle onTap if needed
              },
              child: Container(
                height: 30,
                padding: const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 26),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: FypText(text: value, color: Colors.black),
              ),
            ),
            GestureDetector(
              onTap: () {
                if(widget.type == "route") {
                  context.read<TimeTableProvider>().removeRouteId(key);
                } else if(widget.type == "type") {
                  context.read<TimeTableProvider>().removeType(key);
                  context.read<TimeTableProvider>().count--;
                }
              },
              child: Container(
                padding: const EdgeInsets.only(right: 5),
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.clear,
                  size: 16,
                  color: primaryColor,
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
