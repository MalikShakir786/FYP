import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../../global/global_models/error_model.dart';
import '../../../../global/global_widgets/toast_message.dart';
import '../../../../utils/constants.dart';
import 'package:http/http.dart' as http;

import '../global_models/recent_searches_model.dart';
import '../global_models/timetable_model.dart';

class FindBusProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Search> recentSearches = [];
  List<Timetable>  timetables= [];

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Timetable? getBusDetailById(int id) {
    try {
      return timetables.firstWhere((bus) => bus.id == id);
    } catch (e) {
      return null;
    }
  }


  List<String> destinationLocations = ["Gujrat","Karachi","Lahore","Abbotabad","Islamabad","Peshawar","Mardan","dsgdf dzfgfsddsf dfsdf"];
  List<String> busTimings = ["8:45 am","1:30 pm","3:00 pm","4:45 pm"];
  List<String> busNumbers = List.generate(20, (index) => (index+1).toString());

  var originController = TextEditingController();
  var destinationController = TextEditingController();
  var timeController = TextEditingController();
  var noController = TextEditingController();

  Future<bool> addSearch(BuildContext context) async {
    var url = Uri.https(Constants.baseUrl, EndPoints.searches);
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final body = {
      "user_id": 2,
      "search_query": destinationController.text.trim(),
    };

    print(url);

    setIsLoading(true);
    var response = await http.post(url, headers: headers, body: json.encode(body));
    setIsLoading(false);

    print(response.statusCode);

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

    print(response.statusCode);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      var result = RecentSearches.fromJson(jsonResponse);
      recentSearches = result.searches!;
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

  Future<void> searchTimetable(BuildContext context) async {

    var url = Uri.https(Constants.baseUrl, EndPoints.searchTimetable);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final Map<String,String> body = {
      "rname": destinationController.text.trim(),
      "bus_no": noController.text.trim(),
      "time": timeController.text.trim()
    };

    setIsLoading(true);
    var response = await http.post(url, headers: headers,body: json.encode(body));
    setIsLoading(false);

    print(response.statusCode);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      var result = TimetableResponse.fromJson(jsonResponse);
      timetables = result.timetables;
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      print(errorModel.message);
      // showToast(errorModel.message).show(context);
      notifyListeners();
    }
  }

}
