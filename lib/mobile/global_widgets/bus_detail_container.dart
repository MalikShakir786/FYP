import 'package:flutter/material.dart';
import 'package:fyp/mobile/global_widgets/text_Rows.dart';
import '../../utils/constants.dart';
import '../core/bus_find/bus_details_screen.dart';
import 'fyp_text.dart';


class BusDetailContainer extends StatelessWidget {
  BusDetailContainer({
    super.key,
    required this.starIcon,
  });

  final Icon starIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> BusDetailsScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 260,
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Center(child: FypText(text: "Student (Combine)",color: primaryColor,fontWeight: FontWeight.bold,fontSize: 14,)),
                  Align(
                      alignment: Alignment.centerRight,
                      child: starIcon,
                  )
                ],
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(child: FypText(text: "18",color: Colors.black,fontSize: 21,fontWeight: FontWeight.bold,)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  textContainer(text: "UOG",),
                  Image.asset(FypIcons.doubleArrowHorizontal,height: 30,),
                  textContainer(text: "Gujrat"),
                ],
              ),
              SizedBox(height: 10,),
              textRows(
                firstLeft: "Bus Number :",
                secondLeft: "Driver Name :",
                thirdLeft: "Driver Contact :",
                firstRight: "GTJ - 1018",
                secondRight: "XYZ",
                thirdRight: "0383-5565151",
              )
            ],

          ),
        ),
      ),
    );
  }
}


class textContainer extends StatelessWidget {
  textContainer({
    super.key,
    required this.text,
  });

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 110,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: FypText(text: text,
          fontSize: 15,
        ),
      ),
    );
  }
}
