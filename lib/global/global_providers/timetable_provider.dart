import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp/global/global_widgets/toast_message.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import '../global_models/error_model.dart';
import '../global_models/timetable_model.dart';

class TimeTableProvider extends ChangeNotifier {
  List<String> busTimings = ["8:45", "1:30", "3:00", "4:30"];
  List<String> busRoute = [
    "Rawalpindi",
    "Faisalabad",
    "Multan",
    "Quetta",
    // Add other routes here...
  ];

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

  List<String> routesList = [];
  var timingController = TextEditingController();
  var routeController = TextEditingController();

  void addRoute(String route, BuildContext context) {
    if (route.isNotEmpty) {
      if (!routesList.contains(route)) {
        routesList.add(route);
        notifyListeners();
      } else {
        showToast("Already added!").show(context);
      }
    }
  }

  void removeRoute(String route) {
    if (routesList.contains(route)) {
      routesList.remove(route);
      notifyListeners();
    }
  }

  List<Timetable> timetables = [];

  // Get TimeTables
  Future<void> getTimetable(BuildContext context) async {
    var url = Uri.https(Constants.baseUrl, EndPoints.showTimetable);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    setIsLoading(true);
    var response = await http.get(url, headers: headers);
    setIsLoading(false);

    if (response.statusCode == 200) {
      var results = TimetableResponse.fromJson(json.decode(response.body));
      timetables = results.timetables;
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      print("Failed to fetch buses: ${errorModel.message}");
    }
  }
}
