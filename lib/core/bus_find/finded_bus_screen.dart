import 'package:flutter/material.dart';
import 'package:fyp/global_widgets/bus_detail_container.dart';
import 'package:fyp/global_widgets/fyp_navbar.dart';
import 'package:fyp/global_widgets/fyp_text.dart';

import '../../global_widgets/text_Rows.dart';
import '../../utils/constants.dart';

class FindedBusScreen extends StatelessWidget {
  const FindedBusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10,),
          FypNavBar(title: "Finded Bus Details"),
          SizedBox(height: 10,),
          BusDetailContainer(),
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
                      return recentSearchContainer();
                    }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class recentSearchContainer extends StatelessWidget {
  const recentSearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: FypText(
                  text: "21",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: textRows(
                busNumber: "GTJ - 1018",
                driverName: "XYZ",
                driverContact: "0383-5565151",
              ),
            )
          ],
        ),
      ),
    );
  }
}
