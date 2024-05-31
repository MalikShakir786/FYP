import 'package:flutter/material.dart';


import '../../../utils/constants.dart';
import '../../global_widgets/bus_detail_container.dart';
import '../../global_widgets/fyp_navbar.dart';
import '../../global_widgets/fyp_search_bar.dart';

class FavBusList extends StatelessWidget {
  const FavBusList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FypNavBar(title: " Favorite Buses List"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FypSearchBar(),
                    ),
                    SizedBox(height: 10,),
                    Divider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10,),
                    Column(
                      children: List.generate(6, (index){
                        return Column(
                          children: [
                            BusDetailContainer(starIcon: Icon(Icons.star_rounded,color: primaryColor),),
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
