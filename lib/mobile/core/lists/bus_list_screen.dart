import 'package:flutter/material.dart';

import '../../global_widgets/bus_detail_container.dart';
import '../../global_widgets/fyp_navbar.dart';
import '../../global_widgets/fyp_search_bar.dart';


class BusListScreen extends StatelessWidget {
  const BusListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FypNavBar(title: "Buses List"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FypSearchBar(),
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: List.generate(6, (index){
                        return Column(
                          children: [
                            BusDetailContainer(starIcon: Icon(Icons.star_border_rounded,color: Colors.black,),),
                            SizedBox(height: 20,)
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
