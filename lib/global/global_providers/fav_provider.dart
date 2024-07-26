import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp/global/global_models/fav_model.dart';
import 'package:fyp/global/global_providers/auth_provider.dart';
import 'package:fyp/global/global_providers/find_bus_provider.dart';
import 'package:fyp/global/global_providers/timetable_provider.dart';
import 'package:fyp/global/global_widgets/toast_message.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../global_models/error_model.dart';
import 'package:http/http.dart' as http;

class FavProvider extends ChangeNotifier {

  bool _isLoading = false;
  List<FavBus> favBuses = [];

  bool get isLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  clearFavs(){
    favBuses = [];
  }

  var searchController = TextEditingController();

  // Get Favs
  Future<void> getFavs(BuildContext context) async {
    clearFavs();

    final String userId = context.read<AuthProvider>().userData!.userId.toString();

    var url = Uri.https(Constants.baseUrl, EndPoints.favorite, {'user_id': userId});
    final Map<String, String> headers = {'Content-Type': 'application/json'};


    setIsLoading(true);
    var response = await http.get(url, headers: headers);
    setIsLoading(false);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var favBusList = jsonResponse['data'] as List;
      favBuses = favBusList.map((bus) => FavBus.fromJson(bus)).toList();
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      print("Failed to fetch buses: ${errorModel.message}");
    }
  }

  //Delete Favs
  Future<bool> delFavs(BuildContext context,String busId) async {

    final String userId = context.read<AuthProvider>().userData!.userId.toString();

    var url = Uri.https(Constants.baseUrl, EndPoints.favorite, {'user_id': "11"});
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final Map<String,String> body = {
      "user_id": userId,
      "bus_id": busId.toString(),
    };

    setIsLoading(true);
    var response = await http.delete(url, headers: headers,body: json.encode(body));
    setIsLoading(false);

    if (response.statusCode == 200) {
      showToast("Deleted Successfully!").show(context);
      getFavs(context);
      notifyListeners();
      return true;
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      print("Failed to fetch buses: ${errorModel.message}");
      return false;
    }
  }

  //Add favs
  Future<bool> addFavs(BuildContext context,String busId) async {

    final String userId = context.read<AuthProvider>().userData!.userId.toString();

    var url = Uri.https(Constants.baseUrl, EndPoints.favorite, {'user_id': "11"});
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final Map<String,String> body = {
      "user_id": userId,
      "bus_id": busId.toString(),
    };

    setIsLoading(true);
    var response = await http.post(url, headers: headers,body: json.encode(body));
    setIsLoading(false);

    if (response.statusCode == 200) {
      showToast("Added Successfully!").show(context);
      getFavs(context);
      notifyListeners();
      return true;
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      print("Failed to fetch buses: ${errorModel.message}");
      return false;
    }
  }
}
