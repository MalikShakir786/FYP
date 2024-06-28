import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp/global/global_models/route_model.dart';
import '../../utils/constants.dart';
import 'package:http/http.dart' as http;
import '../global_models/error_model.dart';
import '../global_widgets/toast_message.dart';

class RouteProvider extends ChangeNotifier {
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

  List<RouteData> _routes = [];
  List<RouteData> get routes => _routes;

  List<String> routesList = [];

  void clearRoutes() {
    _routes = [];
    notifyListeners();
  }

  var rNameController = TextEditingController();
  var rStartController = TextEditingController();
  var rEndController = TextEditingController();
  var rViaController = TextEditingController();
  var rDurationController = TextEditingController();
  var rSearchController = TextEditingController();

  clearFields(){
    rNameController.clear();
    rEndController.clear();
    rStartController.clear();
    rViaController.clear();
    rDurationController.clear();
  }

  // Get Routes
  Future<void> getRoutes(BuildContext context) async {
    clearRoutes();
    var url = Uri.https(Constants.baseUrl, EndPoints.getRoutes);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    setIsLoading(true);
    var response = await http.get(url, headers: headers);
    setIsLoading(false);

    if (response.statusCode == 200) {
      var routesResponse = RoutesResponse.fromJson(json.decode(response.body));
      _routes = routesResponse.routes;
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      // showToast(errorModel.message).show(context);
      notifyListeners();
    }
  }

  // Search Routes
  Future<void> searchRoutes(BuildContext context) async {
    clearRoutes();
    var url = Uri.https(Constants.baseUrl, EndPoints.getRoutes,{"rname":rSearchController.text.trim()});
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    print(url);

    setIsLoading(true);
    var response = await http.get(url, headers: headers);
    setIsLoading(false);

    if (response.statusCode == 200) {
      var routesResponse = RoutesResponse.fromJson(json.decode(response.body));
      _routes = routesResponse.routes;
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      // showToast(errorModel.message).show(context);
      notifyListeners();
    }
  }

  // Delete Routes
  Future<void> deleteRoute(BuildContext context,int routeId) async {
    clearRoutes();
    var url = Uri.https(Constants.baseUrl, EndPoints.deleteRoutes);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final Map<String,dynamic> body={
      "id": routeId
    };

    setIsDelLoading(true);
    var response = await http.delete(url, headers: headers,body: json.encode(body));
    setIsDelLoading(false);

    print(response.statusCode);

    if (response.statusCode == 200) {
      showToast("Deleted Successfully!").show(context);
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
      notifyListeners();
    }
  }

  // Insert Route
  Future<bool> insertRoute(BuildContext context) async {
    var url = Uri.https(Constants.baseUrl, EndPoints.insertRoutes);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final Map<String, dynamic> body = {
      "rname": rNameController.text,
      "startlocation": rStartController.text,
      "endlocation": rEndController.text,
      "via": rViaController.text,
      "duration": rDurationController.text,
    };

    setIsEditLoading(true);
    var response = await http.post(url, headers: headers, body: json.encode(body));
    setIsEditLoading(false);

    if (response.statusCode == 200) {
      showToast("Route inserted successfully!").show(context);
      clearFields();
      getRoutes(context); // Refresh the routes list
      return true;
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
      return false;
    }
  }

  // Update Route

  void assignFieldsWithBusData(RouteData route) {
    rNameController.text = route.rname ?? '';
    rStartController.text = route.startLocation?? '';
    rEndController.text = route.endLocation?? '';
    rViaController.text = route.via?? '';
    rDurationController.text = route.duration ?? '';
    notifyListeners();
  }

  Future<bool> updateRoute(BuildContext context,int routeId) async {
    var url = Uri.https(Constants.baseUrl, EndPoints.updateRoutes);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final Map<String, dynamic> body = {
      "id": routeId,
      "rname": rNameController.text,
      "startlocation": rStartController.text,
      "via": rViaController.text,
      "endlocation": rEndController.text,
      "duration": rDurationController.text,
    };


    setIsEditLoading(true);
    var response = await http.put(url, headers: headers, body: json.encode(body));
    setIsEditLoading(false);

    if (response.statusCode == 200) {
      showToast("Updated successfully!").show(context);
      getRoutes(context); // Refresh the routes list
      return true;
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
      return false;
    }
  }
}
