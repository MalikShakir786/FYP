import 'package:flutter/material.dart';
import 'package:fyp/global/global_providers/route_provider.dart';
import 'package:provider/provider.dart';

import '../../../global/global_models/route_model.dart';
import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../global/global_widgets/fyp_textfield.dart';
import '../../../utils/constants.dart';

class EditRouteInfo extends StatefulWidget {

  final RouteData route;

  EditRouteInfo({super.key,

  required this.route});

  @override
  _EditRouteInfoState createState() => _EditRouteInfoState();
}

class _EditRouteInfoState extends State<EditRouteInfo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RouteProvider>().assignFieldsWithBusData(widget.route);
    });
  }

  String? errorName;
  String? errorStart;
  String? errorEnd;
  String? errorVia;
  String? errorDuration;

  void _validateAndSubmit() {
    final routeProvider = context.read<RouteProvider>();

    setState(() {
      errorName = routeProvider.rNameController.text.isEmpty
          ? "Please enter route name"
          : null;
      errorStart = routeProvider.rStartController.text.isEmpty
          ? "Please enter start location"
          : null;
      errorEnd = routeProvider.rEndController.text.isEmpty
          ? "Please enter end location"
          : null;
      errorVia = routeProvider.rViaController.text.isEmpty
          ? "Please enter via points"
          : null;
      errorDuration = routeProvider.rDurationController.text.isEmpty
          ? "Please enter duration"
          : null;
    });

    if (errorName == null &&
        errorStart == null &&
        errorEnd == null &&
        errorVia == null &&
        errorDuration == null) {
      updated();
    }
  }

  void updated() async {
    bool isPop = await context.read<RouteProvider>().updateRoute(context,int.parse(widget.route.id));
    if (isPop) {
      Navigator.pop(context);
      context.read<RouteProvider>().clearFields();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        contentPadding: EdgeInsets.all(20),
        backgroundColor: Colors.white,
        content: Container(
          height: 380,
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: FypText(
                  text: "Edit Route Info",
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: _buildFormFields(context),
                  ),
                ),
              ),
              SizedBox(height: 20),
              FypButton(
                isLoading: context.watch<RouteProvider>().isEditLoading,
                buttonColor: primaryColor,
                buttonWidth: MediaQuery.of(context).size.width * 0.5,
                text: "Submit",
                onTap: _validateAndSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFormFields(BuildContext context) {
    final routeProvider = context.read<RouteProvider>();

    return [
      FypTextField(
        controller: routeProvider.rNameController,
        labelText: "Route Name",
        labelColor: Colors.black,
        errorText: errorName,
      ),
      SizedBox(height: 10),
      FypTextField(
        controller: routeProvider.rStartController,
        labelText: "Start Location",
        labelColor: Colors.black,
        errorText: errorStart,
      ),
      SizedBox(height: 10),
      FypTextField(
        controller: routeProvider.rEndController,
        labelText: "End Location",
        labelColor: Colors.black,
        errorText: errorEnd,
      ),
      SizedBox(height: 10),
      FypTextField(
        controller: routeProvider.rViaController,
        labelText: "Via",
        labelColor: Colors.black,
        errorText: errorVia,
      ),
      SizedBox(height: 10),
      FypTextField(
        controller: routeProvider.rDurationController,
        labelText: "Duration",
        labelColor: Colors.black,
        errorText: errorDuration,
      ),
    ];
  }
}
