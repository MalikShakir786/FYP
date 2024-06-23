import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/utils/constants.dart';

import 'fyp_text.dart';

class Alert extends StatelessWidget {
  Alert({
    required this.title,
    super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        content: Container(
          height: 220,
          child: Column(
            children: [
              Center(child: Image.asset(FypIcons.infoIcon,height: 60,width: 60,color: primaryColor,)),
              SizedBox(height: 10,),
              Align(
                  alignment: Alignment.centerLeft,
                  child: FypText(text: "Error!",color: primaryColor,fontSize: 20,)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: FypText(text: title,color: Colors.black,fontSize: 12,)),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: FypText(
                    text: "Ok",
                    fontSize: 14,
                    color: Colors.purple,
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
