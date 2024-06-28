import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/global/global_models/bus_model.dart';
import 'package:fyp/global/global_widgets/toast_message.dart';
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

  bool _isEditLoading = false;

  bool get isEditLoading => _isEditLoading;

  void setIsEditLoading(bool value) {
    _isEditLoading = value;
    notifyListeners();
  }

  bool _isDelLoading = false;

  bool get isDelLoading => _isDelLoading;

  void setIsDelLoading(bool value) {
    _isDelLoading = value;
    notifyListeners();
  }

  List<String> busNumbers = [];
  List<String> busTypes = ["Combine", "Boys", "Girls"];
  List<String> busNoPlates = [];
  List<String> busTimings = ["8:45", "1:30", "3:00", "4:30"];
  List<String> busRoute = [
    "Gujrat",
    "Karachi",
    "Lahore",
    "Abbotabad",
    "Islamabad",
    "Peshawar",
    "Mardan"
  ];
  List<String> driverNames = [];
  List<String> driverContacts = [];
  List<String> conductorNames = [];
  List<String> conductorContacts = [];

  var noController = TextEditingController();
  var searchNoController = TextEditingController();
  var noPlateController = TextEditingController();
  var timeController = TextEditingController();
  var typeController = TextEditingController();
  var routeController = TextEditingController();
  var dNameController = TextEditingController();
  var dContactController = TextEditingController();
  var cNameController = TextEditingController();
  var cContactController = TextEditingController();

  void clearFields() {
    noController.clear();
    noPlateController.clear();
    dNameController.clear();
    dContactController.clear();
    cNameController.clear();
    cContactController.clear();
  }

  void assignFieldsWithBusData(Bus bus) {
    noController.text = bus.busNo ?? '';
    noPlateController.text = bus.plateNo ?? '';
    dNameController.text = bus.driver.driverName ?? '';
    dContactController.text = bus.driver.driverPhone ?? '';
    cNameController.text = bus.conductor.conductorName ?? '';
    cContactController.text = bus.conductor.conductorPhone ?? '';
    notifyListeners();
  }

  // Get Buses
  BusData? busData;

  void clearBuses() {
    busData = null;
  }

  Future<void> getBuses(BuildContext context) async {
    clearBuses();

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
      driverContacts =
          result.data.map((bus) => bus.driver.driverPhone).toList();
      conductorNames =
          result.data.map((bus) => bus.conductor.conductorName).toList();
      conductorContacts =
          result.data.map((bus) => bus.conductor.conductorPhone).toList();

      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      print("Failed to fetch buses: ${errorModel.message}");
    }
  }

  // Update Bus
  Future<void> updateBus(
      BuildContext context, String busId, String driverId) async {
    print("entered");
    var url = Uri.https(Constants.baseUrl, EndPoints.updateBuses);
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, dynamic> body = {
      "bus_id": busId,
      "new_driver_id": driverId,
    };

    setIsEditLoading(true);
    var response =
        await http.put(url, headers: headers, body: jsonEncode(body));
    setIsEditLoading(false);

    if (response.statusCode == 200) {
      showToast("Updated Successfully!").show(context);
      clearFields();
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      print('Failed to update bus: ${errorModel.message}');
    }
  }

  // Delete Bus
  Future<void> deleteBus(BuildContext context, String busId) async {
    print("entered");
    var url = Uri.https(
      Constants.baseUrl,
      EndPoints.deleteBus,
    );
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final Map<String, String> body = {"bus_id": busId};

    setIsDelLoading(true);
    var response =
        await http.delete(url, headers: headers, body: json.encode(body));
    setIsDelLoading(false);
    print(response.statusCode);

    if (response.statusCode == 200) {
      clearBuses();
      showToast("Deleted successfully!").show(context);
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
      notifyListeners();
    }
  }

  //Search Bus
  Future<void> searchBus(BuildContext context) async {
    clearBuses();
    var url = Uri.https(Constants.baseUrl, EndPoints.getBuses,
        {"bus_no": searchNoController.text});
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    print(url);

    setIsLoading(true);
    var response = await http.get(url, headers: headers);
    setIsLoading(false);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var result = BusData.fromJson(json.decode(response.body));
      busData = result;
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      print(errorModel.message);
      // showToast(errorModel.message).show(context);
      notifyListeners();
    }
  }

  // Insert Bus
  Future<bool> insertBus(BuildContext context) async {
    print("entered");
    var url = Uri.https(Constants.baseUrl, EndPoints.insertBus);
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, dynamic> body = {
      "plate_no": noPlateController.text.trim(),
      "bus_no": noController.text.trim(),
      "driver_name": dNameController.text.trim(),
      "driver_phone_no": dContactController.text.trim(),
      "conductor_name": cNameController.text.trim(),
      "conductor_phone_no": cContactController.text.trim()
    };

    setIsEditLoading(true);
    var response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    setIsEditLoading(false);

    if (response.statusCode == 200) {
      showToast("Inserted Successfully!").show(context);
      clearFields();
      getBuses(context);
      notifyListeners();
      return true;
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
      return false;
    }
  }
}
