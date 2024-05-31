import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/mobile/global_widgets/dropdown_field.dart';
import 'package:fyp/mobile/global_widgets/fyp_button.dart';
import 'package:fyp/mobile/global_widgets/fyp_text.dart';
import 'package:fyp/utils/constants.dart';

class EditBusInfo extends StatelessWidget {
  EditBusInfo({super.key});

  final List<String> busNumbers = List.generate(20, (index)=>index.toString());
  final List<String> busTypes = ["Combine","Boys","Girls"];
  final List<String> timings = ["1:30","3:00","4:30"];
  final List<String> routes = [
    'Karachi',
    'Lahore',
    'Faisalabad',
    'Rawalpindi',
    'Multan',
    'Gujranwala',
    'Hyderabad',
    'Peshawar',
    'Quetta',
    'Islamabad',
    'Sargodha',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        contentPadding: EdgeInsets.all(20),
        backgroundColor: Colors.white,
        content: Container(
          width: MediaQuery.of(context).size.width*0.35,
          height: 430,
          child: Column(
            children: [
              Align(alignment: Alignment.topRight,child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset(FypIcons.cross,color: Colors.black,width: 15,))),
              Align(alignment: Alignment.center,child: FypText(text: "Edit Bus Info",color: primaryColor,fontSize: 16,fontWeight: FontWeight.bold,)),
              SizedBox(height: 10,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DropDownMenu(labelColor: Colors.black,title: "Bus No.", itemList: busNumbers),
                      SizedBox(height: 10,),
                      DropDownMenu(labelColor: Colors.black,title: "Bus No.", itemList: busTypes),
                      SizedBox(height: 10,),
                      DropDownMenu(labelColor: Colors.black,title: "Bus No.", itemList: timings),
                      SizedBox(height: 10,),
                      DropDownMenu(labelColor: Colors.black,title: "Bus No.", itemList: routes),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FypButton(buttonColor: primaryColor,buttonWidth: MediaQuery.of(context).size.width*0.1,text: "Save", onTap: (){}),
                  FypButton(buttonWidth: MediaQuery.of(context).size.width*0.1,text: "Next", onTap: (){}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
