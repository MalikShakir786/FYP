import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../global_widgets/fyp_button.dart';
import '../../global_widgets/fyp_navbar.dart';
import '../../global_widgets/fyp_text.dart';
import '../../global_widgets/fyp_textfield.dart';
import 'finded_bus_screen.dart';


class FindBusScreen extends StatelessWidget {
  const FindBusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            FypNavBar(title: "Find Bus"),
            SizedBox(height: 20,),
            Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: primaryColor.withOpacity(0.3)
              ),
              child: Center(
                child: Image.asset(FypIcons.findBus),
              ),
            ),
            FypText(text: "Find Bus Number",
            color: Colors.black,
            fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            FypText(text: "Track your bus using your Bus Stop . . . . ",
              color: Colors.grey,
              fontSize: 14,
            ),
            SizedBox(height: 30,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  child: Column(
                    children: [
                      FypTextField(
                        labelText: "From",
                        prefixIcon: Icon(Icons.location_on,color: primaryColor,),
                        hintText: "From . . . ",
                      ),
                      SizedBox(height: 20,),
                      Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Image.asset(FypIcons.doubleArrowVertical,height: 40,)),
                      FypTextField(labelText: "To",
                        prefixIcon: Icon(Icons.location_on,color: primaryColor,),
                        hintText: "To . . . ",
                      ),
                      SizedBox(height: 50,),
                      FypButton(text: "Search", onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> FindedBusScreen()));
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
