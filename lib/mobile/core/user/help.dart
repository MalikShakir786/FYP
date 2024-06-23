import 'package:flutter/material.dart';
import 'package:fyp/mobile/core/user/users_widgets/custom_expansion_tile.dart';

import '../../../global/global_widgets/fyp_navbar.dart';


class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  int? expandedIndex; // Track the currently expanded tile index

  void _handleExpansion(int index) {
    setState(() {
      if (expandedIndex == index) {
        expandedIndex = null;
      } else {
        expandedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FypNavBar(title: "Help"),
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return CustomExpansionTile(
                    index: index,
                    isExpanded: expandedIndex == index,
                    onExpansionChanged: _handleExpansion,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
