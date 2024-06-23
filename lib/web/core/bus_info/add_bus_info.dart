import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../global/global_providers/auth_provider.dart';
import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../global/global_widgets/fyp_textfield.dart';
import '../../../utils/constants.dart';

class AddBusInfo extends StatefulWidget {
  AddBusInfo({super.key});

  @override
  _AddBusInfoState createState() => _AddBusInfoState();
}

class _AddBusInfoState extends State<AddBusInfo> {

  String? errorBusNumber;
  String? errorBusPlateNumber;
  String? errorDriverName;
  String? errorDriverContactNo;
  String? errorConductorName;
  String? errorConductorContactNo;

  final contactPattern = RegExp(r'^03\d{2}-\d{7}$');

  void _validateAndSubmit() {
    setState(() {
      errorBusNumber = context.read<AuthProvider>().confirmPasswordController.text.isEmpty
          ? "Please enter bus number"
          : null;
      errorBusPlateNumber = context.read<AuthProvider>().confirmPasswordController.text.isEmpty
          ? "Please enter bus plate number"
          : null;
      errorDriverName = context.read<AuthProvider>().confirmPasswordController.text.isEmpty
          ? "Please enter driver name"
          : null;
      errorDriverContactNo = context.read<AuthProvider>().confirmPasswordController.text.isEmpty
          ? "Please enter driver contact number"
          : (!contactPattern.hasMatch(context.read<AuthProvider>().confirmPasswordController.text)
          ? "Invalid contact format (e.g., 0300-0000000)"
          : null);
      errorConductorName = context.read<AuthProvider>().confirmPasswordController.text.isEmpty
          ? "Please enter conductor name"
          : null;
      errorConductorContactNo = context.read<AuthProvider>().confirmPasswordController.text.isEmpty
          ? "Please enter conductor contact number"
          : (!contactPattern.hasMatch(context.read<AuthProvider>().confirmPasswordController.text)
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        contentPadding: EdgeInsets.all(20),
        backgroundColor: Colors.white,
        content: Container(
          height: 350,
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
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
                  text: "Add Bus Info",
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                FypTextField(
                                  controller: context.read<AuthProvider>().confirmPasswordController,
                                  labelText: "Bus Number",
                                  labelColor: Colors.black,
                                  errorText: errorBusNumber,
                                ),
                                SizedBox(height: 10),
                                FypTextField(
                                  controller: context.read<AuthProvider>().confirmPasswordController,
                                  labelText: "Bus Plate Number",
                                  labelColor: Colors.black,
                                  errorText: errorBusPlateNumber,
                                ),
                                SizedBox(height: 10),
                                FypTextField(
                                  controller: context.read<AuthProvider>().confirmPasswordController,
                                  labelText: "Driver Name",
                                  labelColor: Colors.black,
                                  errorText: errorDriverName,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              children: [
                                FypTextField(
                                  controller: context.read<AuthProvider>().confirmPasswordController,
                                  labelText: "Driver Contact No.",
                                  labelColor: Colors.black,
                                  errorText: errorDriverContactNo,
                                ),
                                SizedBox(height: 10),
                                FypTextField(
                                  controller: context.read<AuthProvider>().confirmPasswordController,
                                  labelText: "Conductor Name",
                                  labelColor: Colors.black,
                                  errorText: errorConductorName,
                                ),
                                SizedBox(height: 10),
                                FypTextField(
                                  controller: context.read<AuthProvider>().confirmPasswordController,
                                  labelText: "Conductor Contact No.",
                                  labelColor: Colors.black,
                                  errorText: errorConductorContactNo,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              FypButton(
                buttonColor: primaryColor,
                buttonWidth: MediaQuery.of(context).size.width * 0.1,
                text: "Submit",
                onTap: _validateAndSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
