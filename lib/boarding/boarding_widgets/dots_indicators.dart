import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomIndicator extends StatelessWidget {
  final bool isActive;

  const CustomIndicator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(isActive);
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 10.0,
      width: isActive ? 20.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
