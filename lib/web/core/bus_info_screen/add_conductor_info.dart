import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/mobile/global_widgets/dropdown_field.dart';
import 'package:fyp/mobile/global_widgets/fyp_button.dart';
import 'package:fyp/mobile/global_widgets/fyp_text.dart';
import 'package:fyp/mobile/global_widgets/fyp_textfield.dart';
import 'package:fyp/utils/constants.dart';
import 'package:fyp/web/core/bus_info_screen/add_driver_info.dart';

class AddConductorInfo extends StatelessWidget {
  AddConductorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        contentPadding: EdgeInsets.all(20),
        backgroundColor: Colors.white,
        content: Container(
          width: MediaQuery.of(context).size.width*0.35,
          height: 350,
          child: Column(
            children: [
              Align(alignment: Alignment.topRight,child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset(FypIcons.cross,color: Colors.black,width: 15,))),
              Align(alignment: Alignment.center,child: FypText(text: "Add Conductor Info",color: primaryColor,fontSize: 16,fontWeight: FontWeight.bold,)),
              SizedBox(height: 10,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FypTextField(labelText: "Conductor ID",labelColor: Colors.black,),
                      SizedBox(height: 10,),
                      FypTextField(labelText: "Conductor Name",labelColor: Colors.black,),
                      SizedBox(height: 10,),
                      FypTextField(labelText: "Contact No.",labelColor: Colors.black,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FypButton(buttonWidth: MediaQuery.of(context).size.width*0.1,text: "< Back", onTap: (){
                    Navigator.pop(context);
                    showDialog(
                        barrierDismissible: false,
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (BuildContext context) {
                          return AddDriverInfo();
                        });
                  }),
                  FypButton(buttonColor: primaryColor,buttonWidth: MediaQuery.of(context).size.width*0.1,text: "Next >", onTap: (){
                    Navigator.pop(context);
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
