import 'package:flutter/material.dart';

import '../../../global/global_widgets/fyp_text.dart';

class ManualScheduling extends StatelessWidget {
  const ManualScheduling({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FypText(
            text: 'Manual Scheduling Settings',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          SizedBox(height: 10),
          FypText(
            text: 'Manually set the schedule below:',
            color: Colors.black,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Date',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Time',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: FypText(
              text: 'Apply Manual Scheduling',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}