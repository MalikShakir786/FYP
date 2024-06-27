import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../global/global_models/bus_model.dart';
import '../../../global/global_providers/bus_provider.dart';
import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../global/global_widgets/dropdown_field.dart'; // Import your DropDownField widget
import '../../../utils/constants.dart';

class EditBusInfo extends StatefulWidget {
  final Bus? bus;

  const EditBusInfo({Key? key, this.bus}) : super(key: key);

  @override
  _EditBusInfoState createState() => _EditBusInfoState();
}

class _EditBusInfoState extends State<EditBusInfo> {
  @override
  void initState() {
    super.initState();
    if (widget.bus != null) {
      final provider = context.read<BusProvider>();
      provider.assignFieldsWithBusData(widget.bus!);
    }
  }

  String? errorBusNumber;
  String? errorBusPlateNumber;
  String? errorDriverName;
  String? errorDriverContactNo;
  String? errorConductorName;
  String? errorConductorContactNo;

  final contactPattern = RegExp(r'^03\d{2}-\d{7}$');

  void _validateAndUpdate() {
    final provider = context.read<BusProvider>();
    setState(() {
      errorBusNumber = provider.noController.text.isEmpty ? "Please select bus number" : null;
      errorBusPlateNumber = provider.noPlateController.text.isEmpty ? "Please select bus plate number" : null;
      errorDriverName = provider.dNameController.text.isEmpty ? "Please select driver name" : null;
      errorDriverContactNo = provider.dContactController.text.isEmpty
          ? "Please select driver contact number"
          : (!contactPattern.hasMatch(provider.dContactController.text)
          ? "Invalid contact format (e.g., 0300-0000000)"
          : null);
      errorConductorName = provider.cNameController.text.isEmpty ? "Please select conductor name" : null;
      errorConductorContactNo = provider.cContactController.text.isEmpty
          ? "Please select conductor contact number"
          : (!contactPattern.hasMatch(provider.cContactController.text)
          ? "Invalid contact format (e.g., 0300-0000000)"
          : null);
    });

    if (errorBusNumber == null &&
        errorBusPlateNumber == null &&
        errorDriverName == null &&
        errorDriverContactNo == null &&
        errorConductorName == null &&
        errorConductorContactNo == null) {
      Navigator.pop(context);
    }
  }

  bool isDisabled = true;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BusProvider>();

    return Center(
      child: AlertDialog(
        contentPadding: EdgeInsets.all(20),
        backgroundColor: Colors.white,
        content: Container(
          height: 380,
          width: MediaQuery.of(context).size.width * 0.6,
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isSmallScreen = constraints.maxWidth < 500;
              return Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        FypIcons.cross,
                        color: Colors.black,
                        width: 15,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: FypText(
                      text: "Edit Bus Info",
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: isSmallScreen
                          ? Column(
                        children: _buildFormFields(context, provider),
                      )
                          : Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: _buildLeftColumnFields(context, provider),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              children: _buildRightColumnFields(context, provider),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  FypButton(
                    buttonColor: primaryColor,
                    buttonWidth: MediaQuery.of(context).size.width * 0.5,
                    text: "Update",
                    onTap: _validateAndUpdate,
                    isDisabled: isDisabled,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFormFields(BuildContext context, BusProvider provider) {
    return [
      DropDownField(
        itemList: provider.busNumbers,
        onChange: (value) => _enableButton(provider),
        controller: provider.noController,
        labelText: "Bus Number",
        labelColor: Colors.black,
        errorText: errorBusNumber,
        isEnable: false,
      ),
      SizedBox(height: 10),
      DropDownField(
        itemList: provider.busNoPlates,
        onChange: (value) => _enableButton(provider),
        controller: provider.noPlateController,
        labelText: "Bus Plate Number",
        labelColor: Colors.black,
        errorText: errorBusPlateNumber,
        isEnable: false,
      ),
      SizedBox(height: 10),
      DropDownField(
        itemList: provider.driverNames,
        onChange: (value) {
          provider.dNameController.text = value; // Update driver name field
          _updateRelatedFields(provider); // Update related fields
          _enableButton(provider);
        },
        controller: provider.dNameController,
        labelText: "Driver Name",
        labelColor: Colors.black,
        errorText: errorDriverName,
      ),
      SizedBox(height: 10),
      DropDownField(
        itemList: provider.driverContacts,
        onChange: (value) => _enableButton(provider),
        controller: provider.dContactController,
        labelText: "Driver Contact No.",
        labelColor: Colors.black,
        errorText: errorDriverContactNo,
        isEnable: false,
      ),
      SizedBox(height: 10),
      DropDownField(
        itemList: provider.conductorNames,
        onChange: (value) => _enableButton(provider),
        controller: provider.cNameController,
        labelText: "Conductor Name",
        labelColor: Colors.black,
        errorText: errorConductorName,
        isEnable: false,
      ),
      SizedBox(height: 10),
      DropDownField(
        itemList: provider.conductorContacts,
        onChange: (value) => _enableButton(provider),
        controller: provider.cContactController,
        labelText: "Conductor Contact No.",
        labelColor: Colors.black,
        errorText: errorConductorContactNo,
        isEnable: false,
      ),
    ];
  }

  List<Widget> _buildLeftColumnFields(BuildContext context, BusProvider provider) {
    return [
      DropDownField(
        itemList: provider.busNumbers,
        onChange: (value) => _enableButton(provider),
        controller: provider.noController,
        labelText: "Bus Number",
        labelColor: Colors.black,
        errorText: errorBusNumber,
        isEnable: false,
      ),
      SizedBox(height: 10),
      DropDownField(
        itemList: provider.busNoPlates,
        onChange: (value) => _enableButton(provider),
        controller: provider.noPlateController,
        labelText: "Bus Plate Number",
        labelColor: Colors.black,
        errorText: errorBusPlateNumber,
        isEnable: false,
      ),
      SizedBox(height: 10),
      DropDownField(
        itemList: provider.driverNames,
        onChange: (value) {
          provider.dNameController.text = value; // Update driver name field
          _updateRelatedFields(provider); // Update related fields
          _enableButton(provider);
        },
        controller: provider.dNameController,
        labelText: "Driver Name",
        labelColor: Colors.black,
        errorText: errorDriverName,
      ),
    ];
  }

  List<Widget> _buildRightColumnFields(BuildContext context, BusProvider provider) {
    return [
      DropDownField(
        itemList: provider.driverContacts,
        onChange: (value) => _enableButton(provider),
        controller: provider.dContactController,
        labelText: "Driver Contact No.",
        labelColor: Colors.black,
        errorText: errorDriverContactNo,
        isEnable: false,
      ),
      SizedBox(height: 10),
      DropDownField(
        itemList: provider.conductorNames,
        onChange: (value) => _enableButton(provider),
        controller: provider.cNameController,
        labelText: "Conductor Name",
        labelColor: Colors.black,
        errorText: errorConductorName,
        isEnable: false,
      ),
      SizedBox(height: 10),
      DropDownField(
        itemList: provider.conductorContacts,
        onChange: (value) => _enableButton(provider),
        controller: provider.cContactController,
        labelText: "Conductor Contact No.",
        labelColor: Colors.black,
        errorText: errorConductorContactNo,
        isEnable: false,
      ),
    ];
  }

  void _enableButton(BusProvider provider) {
    setState(() {
      isDisabled = false;
    });
  }

  void _updateRelatedFields(BusProvider provider) {
    // Retrieve driver name from controller
    String driverName = provider.dNameController.text;

    // Find the bus data that matches the selected driver name
    Bus? selectedBus;
    for (int i = 0; i < provider.busData!.data.length; i++) {
      if (provider.busData!.data[i].driver.driverName == driverName) {
        selectedBus = provider.busData!.data[i];
        break;
      }
    }

    // Update driver contact based on selected bus data
    if (selectedBus != null) {
      provider.dContactController.text = selectedBus.driver.driverPhone;
    } else {
      provider.dContactController.text = '';
    }

    // Update conductor name and contact based on selected bus data
    if (selectedBus != null) {
      provider.cNameController.text = selectedBus.conductor.conductorName;
      provider.cContactController.text = selectedBus.conductor.conductorPhone;
    } else {
      provider.cNameController.text = '';
      provider.cContactController.text = '';
    }
  }



}

