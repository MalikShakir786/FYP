import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/global_providers/bus_provider.dart';
import '../../../global/global_widgets/bus_detail_container.dart';
import '../../../global/global_widgets/dropdown_field.dart';
import '../../../global/global_widgets/fyp_navbar.dart';
import '../../../utils/constants.dart';

class FavBusList extends StatelessWidget {
  const FavBusList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FypNavBar(title: " Favorite Buses List"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropDownField(
                  itemList: context.read<BusProvider>().busNumbers,
                  controller: context.read<BusProvider>().noController,
                fillColor: primaryColor.withOpacity(0.4),
                hintText: "Bus number",
              ),
            ),
            SizedBox(height: 10,),
            Divider(thickness: 1,height: 0,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: List.generate(6, (index) {
                        return Column(
                          children: [
                            BusDetailContainer(
                              starIcon:
                                  Icon(Icons.star_rounded, color: primaryColor),
                            ),
                            SizedBox(
                              height: 20,
                            )
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
