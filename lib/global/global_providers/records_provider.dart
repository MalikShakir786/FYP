import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/global/global_models/records_model.dart';

import '../../utils/constants.dart';
import 'package:http/http.dart' as http;

import '../global_models/error_model.dart';

class RecordsProvider extends ChangeNotifier{
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  BusRecordsResponse? records;

  Future<void> getRecords(BuildContext context) async {
    records = null;

    var url = Uri.https(Constants.baseUrl, EndPoints.getRecords);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    setIsLoading(true);
    var response = await http.get(url, headers: headers);
    setIsLoading(false);

    if (response.statusCode == 200) {
      var result = BusRecordsResponse.fromJson(json.decode(response.body));
      records = result;
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      print("Failed to fetch buses: ${errorModel.message}");
    }
  }
}