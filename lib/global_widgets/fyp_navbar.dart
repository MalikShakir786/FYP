import 'package:flutter/material.dart';
import 'package:fyp/global_widgets/fyp_text.dart';
import 'package:fyp/utils/constants.dart';

class FypNavBar extends StatelessWidget{

  FypNavBar({
   super.key,
    required this.title,
});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(30)
            ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Image.asset(FypIcons.backArrow,height: 18,))),
                )
              ],
            ),
          ),
        ),
        Divider(thickness: 1,)
      ],
    );
  }

}