import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'fyp_text.dart';

class FypNavBar extends StatelessWidget {
  FypNavBar({
    super.key,
    required this.title,
    this.prefixIcon,
    this.onTap,
    this.isShowPrefix = true
  });

  final String title;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final bool isShowPrefix;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          child: Stack(
            children: [
              Center(
                child: FypText(
                  text: title,
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if(isShowPrefix)
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: onTap ?? () {
                      Navigator.pop(context);
                    },
                    child:
                    prefixIcon ?? Image.asset(FypIcons.backArrow, height: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
