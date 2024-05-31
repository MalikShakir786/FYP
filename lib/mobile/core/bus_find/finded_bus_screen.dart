import 'package:flutter/material.dart';


import '../../../utils/constants.dart';
import '../../global_widgets/bus_detail_container.dart';
import '../../global_widgets/bus_small_detail_container.dart';
import '../../global_widgets/fyp_navbar.dart';
import '../../global_widgets/fyp_text.dart';

class FindedBusScreen extends StatelessWidget {
  const FindedBusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FypNavBar(title: "Finded Bus Details"),
            SizedBox(height: 10,),
            BusDetailContainer(starIcon: Icon(Icons.star_border_rounded,color: Colors.black,),),
            SizedBox(height: 30,),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FypText(text: "Recent Searches :",
                    fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context,index){
                        return BusSmallDetailContainer();
                      }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

