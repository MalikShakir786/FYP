import 'package:flutter/material.dart';
import '../../global/global_widgets/fyp_text.dart';
import '../../utils/constants.dart';

class BoardingPage extends StatelessWidget {
  const BoardingPage({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
  });

  final String title;
  final String subTitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
          FypText(
            text: title,
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: primaryColor,
          ),
          SizedBox(
            height: 10,
          ),
          FypText(
            text: subTitle,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          Spacer(),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset(
              imagePath,
            ),
        ),
        Spacer()
      ],
    );
  }
}
