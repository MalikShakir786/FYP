import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp/global/global_widgets/toast_message.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import '../global_models/error_model.dart';
import '../global_models/timetable_model.dart';
import '../global_models/web_timetabel_model.dart';

class TimeTableProvider extends ChangeNotifier {
  List<String> busTimings = ["12:00:00", "13:30:00", "15:00:00", "16:30:00"];
  List<String> busTypes = ["Combine", "Boys", "Girls"];
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

  Map<String, String> selectedRouteIds = {};

  void addRouteId(String routeId, String routeData) {
    selectedRouteIds[routeId] = routeData;
    notifyListeners();
  }

  void removeRouteId(String id) {
    print("removed");
    selectedRouteIds.remove(id);
    notifyListeners();
  }

  Map<String, String> selectedTypes = {};

  void addType(String typeId, String typeName) {
    selectedTypes[typeId] = typeName;
    notifyListeners();
  }

  void removeType(String id) {
    print("removed");
    selectedTypes.remove(id);
    notifyListeners();
  }

  int count = 0;

  List<String> routesList = [];
  var timingController = TextEditingController();
  var routeController = TextEditingController();
  var typeController = TextEditingController();

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

  List<WebTimetable> timetables = [];

  // Get TimeTables
  Future<void> getTimetable(BuildContext context) async {
    timetables = [];
    var url = Uri.https(Constants.baseUrl, EndPoints.showTimetable);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    setIsLoading(true);
    var response = await http.get(url, headers: headers);
    setIsLoading(false);

    if (response.statusCode == 200) {
      var results = WebTimetableResponse.fromJson(json.decode(response.body));
      timetables = results.timetables;
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      print("Failed to fetch timetables: ${errorModel.message}");
    }
  }

  // Remove Timetable
  Future<void> removeTimetable(BuildContext context, String id) async {
    var url = Uri.https(Constants.baseUrl, EndPoints.deleteTimetable);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final body = {
      "id": id
    };

    print(id);
    setIsDelLoading(true);
    var response = await http.delete(url, headers: headers, body: json.encode(body));
    setIsDelLoading(false);
    print(response.statusCode);
    if (response.statusCode == 200) {
      getTimetable(context);
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      print("Failed to remove timetable: ${errorModel.message}");
    }
  }

  // Create Timetable

  var noController = TextEditingController();
  var statusController = TextEditingController();
  var sTimeController = TextEditingController();
  var dTimeController = TextEditingController();
  var routeIdController = TextEditingController();

  clearFields(){
    noController.clear();
    statusController.clear();
    dTimeController.clear();
    routeIdController.clear();
  }

  String routeId = "";

  void setRouteId(String id, String routeName){
    routeId = id;
    routeIdController.text = routeName;
    notifyListeners();
  }

  Future<void> createTimetable(BuildContext context) async {
    var url = Uri.https(Constants.baseUrl, EndPoints.insertTimetable);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final body = {
      "bus_no": noController.text.trim(),
      "status": statusController.text.trim(),
      "s_time": sTimeController.text.trim(),
      "departure_time": dTimeController.text.trim(),
      "route_id": routeId,
    };

    setIsEditLoading(true);
    var response = await http.post(url, headers: headers, body: json.encode(body));
    setIsEditLoading(false);

    if (response.statusCode == 200) {
      clearFields();
      showToast("Timetable created successfully!").show(context);
      getTimetable(context);
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast("Failed to create timetable: ${errorModel.message}").show(context);
    }
  }
}
