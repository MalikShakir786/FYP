import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import '../global_models/error_model.dart';
import '../global_models/user_list_model.dart';
import '../global_widgets/toast_message.dart';

class UserProvider extends ChangeNotifier{

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  UserListModel? usersList;
  User? userData;

  var sEmailController = TextEditingController();

  // Get Users
  Future<void> getUsers(BuildContext context) async {

    print("entered");
    var url = Uri.https(Constants.baseUrl, EndPoints.getUser);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    setIsLoading(true);
    var response = await http.get(url, headers: headers);
    setIsLoading(false);

    print(response.statusCode);

    if (response.statusCode == 200) {
      var result = UserListModel.fromJson(json.decode(response.body));
      usersList = result;
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
      notifyListeners();
    }
  }

  // Search User

  Future<void> searchUser(BuildContext context) async {
    var url = Uri.https(Constants.baseUrl, EndPoints.searchUser);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final Map<String, String> body = {
      "user_email": sEmailController.text.trim()
    };

    setIsLoading(true);
    var response = await http.post(url, headers: headers, body: json.encode(body));
    setIsLoading(false);

    print(response.statusCode);

    if (response.statusCode == 200) {
      var result = UserListModel.fromJson(json.decode(response.body));
      usersList = result;
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
    }

    notifyListeners();
  }


}