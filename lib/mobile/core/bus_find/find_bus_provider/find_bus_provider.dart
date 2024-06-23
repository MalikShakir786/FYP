import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp/mobile/core/bus_find/find_bus_models/recent_searches_model.dart';
import '../../../../global/global_models/error_model.dart';
import '../../../../global/global_widgets/toast_message.dart';
import '../../../../utils/constants.dart';
import 'package:http/http.dart' as http;

class FindBusProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  RecentSearches? recent;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<String> destinationLocations = ["Gujrat","Karachi","Lahore","Abbotabad","Islamabad","Peshawar","Mardan","dsgdf dzfgfsddsf dfsdf"];
  List<String> busTimings = ["8:45","1:30","3:00","4:30"];

  var originController = TextEditingController();
  var destinationController = TextEditingController();
  var timeController = TextEditingController();

  Future<bool> addSearch(BuildContext context) async {
    var url = Uri.https(Constants.baseUrl, EndPoints.searches);
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final body = {
      "user_id": 2,
      "search_query": destinationController.text.trim(),
    };

    print(body);

    setIsLoading(true);
    var response = await http.post(url, headers: headers, body: json.encode(body));
    setIsLoading(false);

    response.statusCode;

    if (response.statusCode == 200) {
      return true;
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
      return false;
    }
  }

  Future<void> getSearches(BuildContext context) async {
    var url = Uri.https(Constants.baseUrl, EndPoints.searches, {"user_id": "2"});
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    setIsLoading(true);
    var response = await http.get(url, headers: headers);
    setIsLoading(false);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      recent = RecentSearches.fromJson(jsonResponse);
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
      notifyListeners();
    }
  }

  Future<bool> deleteSearch(BuildContext context,String searchQuery) async {
    var url = Uri.https(Constants.baseUrl, EndPoints.searches,);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final body = {
      "user_id": 2,
      "search_query": searchQuery.toString(),
    };


    setIsLoading(true);
    var response = await http.delete(url, headers: headers,body: json.encode(body));
    setIsLoading(false);

    print(response.statusCode);
    print(searchQuery);
    print(body);


    if (response.statusCode == 200) {
      return true;
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
      return false;
    }
  }
}
