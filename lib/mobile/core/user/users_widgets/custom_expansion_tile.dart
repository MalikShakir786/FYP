import 'package:flutter/material.dart';

import '../../../../../utils/constants.dart';
import '../../../global_widgets/fyp_text.dart';

class CustomExpansionTile extends StatelessWidget {
  final int index;
  final bool isExpanded;
  final ValueChanged<int> onExpansionChanged;

  CustomExpansionTile({
    Key? key,
    required this.index,
    required this.isExpanded,
    required this.onExpansionChanged,
  }) : super(key: key);

  void _handleTap() {
    onExpansionChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: primaryColor.withOpacity(0.4),
                  width: 1
              )
          )
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: _handleTap,
            child: ListTile(
              leading: Image.asset(FypIcons.getHelp,height: 18,width: 18,),
              title: FypText(text: "What is your name?",fontWeight: FontWeight.w600,color: Theme.of(context).colorScheme.secondary,),
              trailing: isExpanded ? Icon(Icons.arrow_drop_up) : Icon(Icons.arrow_drop_down),
            ),
          ),
          AnimatedContainer(
            height: isExpanded ? null : 0,
            duration: Duration(milliseconds: 200),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: FypText(
                text: "My name is University of Gujrat",
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
