import 'package:flutter/material.dart';
import 'package:fyp/mobile/global_widgets/fyp_text.dart';
import 'package:fyp/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../boarding/bus_provider.dart';
import '../../global_widgets/dropdown_field.dart';
import '../../global_widgets/fyp_button.dart';
import 'find_bus_provider/find_bus_provider.dart';
import 'find_bus_widgets/recent_searches.dart';
import 'finded_bus_screen.dart';

class FindBusScreen extends StatefulWidget {
  FindBusScreen({super.key});

  @override
  State<FindBusScreen> createState() => _FindBusScreenState();
}

class _FindBusScreenState extends State<FindBusScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> originLocations = ["University of Gujrat"];

  String? errorOrigin;
  String? errorDestination;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FindBusProvider>().getSearches(context);
    });
  }

  void _validateAndSearch(BuildContext context) {
    setState(() {
      errorOrigin = context.read<FindBusProvider>().originController.text.isEmpty
          ? 'Please select an origin'
          : null;
      errorDestination =
      context.read<FindBusProvider>().destinationController.text.isEmpty
          ? 'Please select a destination'
          : null;
    });

    if (errorOrigin == null &&
        errorDestination == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FindedBusScreen(),
        ),
      );
      context.read<FindBusProvider>().addSearch(context);
      context.read<FindBusProvider>().getSearches(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    FypImages.bannerImage8,
                    height: 180,
                  ),
                ),
                FypText(
                  text: "Find Bus Number",
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                FypText(
                  text: "Search your bus using your Bus Stop . . . . ",
                  color: Colors.black87,
                  fontSize: 14,
                ),
                SizedBox(height: 20),
                DropDownField(
                  initialValue: "University of Gujrat",
                  itemList: originLocations,
                  labelText: "Origin",
                  labelColor: Colors.black,
                  fillColor: primaryColor.withOpacity(0.4),
                  controller: context.read<FindBusProvider>().originController,
                  prefixIcon: Icon(Icons.location_on, color: primaryColor),
                  errorText: errorOrigin,
                ),
                SizedBox(height: 10),
                Center(
                  child: Transform.rotate(
                    angle: 1.6,
                    child: Image.asset(
                      FypIcons.doubleArrowHorizontal,
                      height: 30,
                    ),
                  ),
                ),
                DropDownField(
                  itemList: context.read<BusProvider>().busRoute,
                  labelText: "Destination",
                  labelColor: Colors.black,
                  fillColor: primaryColor.withOpacity(0.4),
                  controller:
                  context.read<FindBusProvider>().destinationController,
                  prefixIcon: Icon(Icons.location_on, color: primaryColor),
                  errorText: errorDestination,
                ),
                SizedBox(height: 20),
                FypButton(
                  buttonWidth: double.infinity,
                  buttonHeight: 50,
                  text: "Search",
                  onTap: () => _validateAndSearch(context),
                ),
                SizedBox(height: 20),
                RecentSearchesWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
