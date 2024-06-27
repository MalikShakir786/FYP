import 'package:flutter/material.dart';
import '../../../../global/global_widgets/fyp_text.dart';
import '../../../../utils/constants.dart';
import 'package:provider/provider.dart';
import '../../../../global/global_providers/timetable_provider.dart';

class RouteSaver extends StatelessWidget {
  const RouteSaver({super.key, required this.routes});

  final List<String> routes;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: routes.map((route) {
        return Stack(
          alignment: Alignment.centerRight,
          children: [
            GestureDetector(
              onTap: () {
                // Handle tap event if needed
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
                child: FypText(text: route, color: Colors.black),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.read<TimeTableProvider>().removeRoute(route);
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
      }).toList(),
    );
  }
}
