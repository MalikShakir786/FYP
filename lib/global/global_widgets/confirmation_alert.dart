import 'package:flutter/material.dart';
import 'package:fyp/utils/constants.dart';

import 'fyp_button.dart';
import 'fyp_text.dart';

class ConfirmationAlert extends StatelessWidget {
  ConfirmationAlert({
    required this.title,
    required this.subTitle,
    required this.onTap,
    super.key});

  final String title;
  final String subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        content: Container(
          height: 230,
          child: Column(
            children: [
              Center(child: Image.asset(FypIcons.infoIcon,height: 60,width: 60,color: primaryColor,)),
              FypText(text: title,color: primaryColor,fontSize: 20,fontWeight: FontWeight.bold,),
              SizedBox(height: 10,),
              FypText(text: subTitle,color: Colors.black,fontSize: 14,),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FypButton(text: "No",buttonColor: Colors.grey.withOpacity(0.3),buttonWidth: 100,onTap: (){
                    Navigator.pop(context);
                  }),
                  SizedBox(width: 30,),
                  FypButton(text: "Yes",buttonWidth: 100, onTap: onTap),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
