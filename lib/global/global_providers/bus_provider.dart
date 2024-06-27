import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/global/global_models/bus_model.dart';
import 'package:fyp/utils/constants.dart';
import 'package:http/http.dart' as http;

import '../global_models/error_model.dart';

class BusProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<String> busNumbers = [];
  List<String> busTypes = ["Combine", "Boys", "Girls"];
  List<String> busNoPlates = [];
  List<String> busTimings = ["8:45", "1:30", "3:00", "4:30"];
  List<String> busRoute = ["Gujrat", "Karachi", "Lahore", "Abbotabad", "Islamabad", "Peshawar", "Mardan"];
  List<String> driverNames = [];
  List<String> driverContacts = [];
  List<String> conductorNames = [];
  List<String> conductorContacts = [];

  var noController = TextEditingController();
  var noPlateController = TextEditingController();
  var timeController = TextEditingController();
  var typeController = TextEditingController();
  var routeController = TextEditingController();
  var dNameController = TextEditingController();
  var dContactController = TextEditingController();
  var cNameController = TextEditingController();
  var cContactController = TextEditingController();

  void assignFieldsWithBusData(Bus bus) {
    noController.text = bus.busNo ?? '';
    noPlateController.text = bus.plateNo ?? '';
    dNameController.text = bus.driver.driverName ?? '';
    dContactController.text = bus.driver.driverPhone ?? '';
    cNameController.text = bus.conductor.conductorName ?? '';
    cContactController.text = bus.conductor.conductorPhone ?? '';
    notifyListeners();
  }

  void _updateRelatedFields(String driverName) {
    // Update driver contact based on driver name
    if (driverNames.contains(driverName)) {
      int index = driverNames.indexOf(driverName);
      dContactController.text = driverContacts[index];
    } else {
      dContactController.text = '';
    }

    if (conductorNames.contains(driverName)) {
      int index = conductorNames.indexOf(driverName);
      cNameController.text = conductorNames[index];
      cContactController.text = conductorContacts[index];
    } else {
      cNameController.text = '';
      cContactController.text = '';
    }
  }

  // Get Buses
  BusData? busData;

  Future<void> getBuses(BuildContext context) async {
    var url = Uri.https(Constants.baseUrl, EndPoints.getBuses);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    setIsLoading(true);
    var response = await http.get(url, headers: headers);
    setIsLoading(false);

    if (response.statusCode == 200) {
      var result = BusData.fromJson(json.decode(response.body));
      busData = result;

      // Update lists with data from busData
      busNumbers = result.data.map((bus) => bus.busNo).toList();
      busNoPlates = result.data.map((bus) => bus.plateNo).toList();
      driverNames = result.data.map((bus) => bus.driver.driverName).toList();
      driverContacts = result.data.map((bus) => bus.driver.driverPhone).toList();
      conductorNames = result.data.map((bus) => bus.conductor.conductorName).toList();
      conductorContacts = result.data.map((bus) => bus.conductor.conductorPhone).toList();

      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      print("Failed to fetch buses: ${errorModel.message}");
    }
  }



  // Update Bus
  Future<void> updateBus(Bus bus) async {
    var url = Uri.https(Constants.baseUrl, EndPoints.updateBuses);
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, dynamic> body = {
      "bus_id": bus.busId,
      "plate_no": bus.plateNo,
      "bus_no": bus.busNo,
      "driver_id": bus.driver.driverId,
      "driver_name": bus.driver.driverName,
      "driver_phone_no": bus.driver.driverPhone,
      "conductor_id": bus.conductor.conductorId,
      "conductor_name": bus.conductor.conductorName,
      "conductor_phone_no": bus.conductor.conductorPhone,
    };

    setIsLoading(true);
    var response = await http.put(url, headers: headers, body: jsonEncode(body));
    setIsLoading(false);

    if (response.statusCode == 200) {
      var result = BusData.fromJson(json.decode(response.body));
      print('Bus updated successfully');
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      print('Failed to update bus: ${errorModel.message}');
    }
  }
}
