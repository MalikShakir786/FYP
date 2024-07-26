import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../global/global_providers/bus_provider.dart';
import '../../../global/global_providers/fav_provider.dart';
import '../../../global/global_widgets/bus_detail_container.dart';
import '../../../global/global_widgets/dropdown_field.dart';
import '../../../global/global_widgets/fyp_navbar.dart';
import '../../../global/global_widgets/fyp_textfield.dart';
import '../../../utils/constants.dart';

class FavBusList extends StatefulWidget {
  const FavBusList({super.key});

  @override
  State<FavBusList> createState() => _FavBusListState();
}

class _FavBusListState extends State<FavBusList> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("navigate");
      context.read<FavProvider>().getFavs(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FypNavBar(title: "Favorite Buses List",isShowPrefix: false,),
            SizedBox(height: 10),
            Expanded(
              child: Consumer<FavProvider>(
                builder: (context, favProvider, child) {
                  if (favProvider.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (favProvider.favBuses.isEmpty) {
                    return Center(
                      child: Text(
                        "No favorites available",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    child: Column(
                      children: favProvider.favBuses.map((bus) {
                        return Column(
                          children: [
                            BusDetailContainer(
                              starIcon: Icon(Icons.star_rounded, color: primaryColor),
                              busNo: bus.busNo,
                              route: bus.plateNo, // Adjust as necessary
                              type: bus.availability == 0?"Not Available": "Available" ,
                              noPlate: bus.plateNo,
                              driverName: bus.driverName,
                              driverContact: bus.driverPhone,
                              conductorName: bus.conductorName,
                              conductorContact: bus.conductorPhone,
                              busId: bus.busId,
                              id: bus.busId,
                              screen: "fav",
                            ),
                            SizedBox(height: 20),
                          ],
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
