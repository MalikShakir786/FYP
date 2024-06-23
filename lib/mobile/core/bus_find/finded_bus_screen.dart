import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../boarding/bus_provider.dart';
import '../../../utils/constants.dart';
import '../../global_widgets/bus_detail_container.dart';
import '../../global_widgets/bus_small_detail_container.dart';
import '../../global_widgets/dropdown_field.dart';
import '../../global_widgets/fyp_navbar.dart';
import '../../global_widgets/fyp_text.dart';
import 'find_bus_provider/find_bus_provider.dart';
import 'package:provider/provider.dart';

class FindedBusScreen extends StatelessWidget {
  const FindedBusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FypNavBar(title: "Finded Bus Details",),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  DropDownField(
                    itemList: context.read<FindBusProvider>().destinationLocations,
                    fillColor: primaryColor.withOpacity(0.4),
                    hintText: "Destination",
                    controller: context.read<FindBusProvider>().destinationController,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DropDownField(
                          itemList: context.read<BusProvider>().busNumbers,
                          fillColor: primaryColor.withOpacity(0.4),
                          hintText: "Bus number",
                          controller: context.read<BusProvider>().noController,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: DropDownField(
                          initialValue:  context.read<FindBusProvider>().busTimings.first,
                          itemList: context.read<FindBusProvider>().busTimings,
                          fillColor: primaryColor.withOpacity(0.4),
                          hintText: "Bus time",
                          controller: context.read<FindBusProvider>().timeController,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Divider(thickness: 1,height: 0,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(6, (index){
                    return Column(
                      children: [
                        SizedBox(height: 10,),
                        BusDetailContainer(starIcon: Icon(Icons.star_border_rounded,color: Colors.black,),),
                        SizedBox(height: 10,)
                      ],
                    );
                  }),
                ),
              ),
            ),],
        ),
      ),
    );
  }
}

