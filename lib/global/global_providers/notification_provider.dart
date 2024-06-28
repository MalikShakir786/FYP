import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp/global/global_models/notification_model.dart';
import 'package:fyp/global/global_widgets/toast_message.dart';
import 'package:fyp/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../global_models/error_model.dart';
import '../global_providers/auth_provider.dart';

class NotificationProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isDelLoading = false;

  bool get isDelLoading => _isDelLoading;

  void setIsDelLoading(bool value) {
    _isDelLoading = value;
    notifyListeners();
  }

  clearNotifications(){
    notifications = [];
    filteredNotifications = [];
  }

  List<BusInfo> notifications = [];
  List<BusInfo> filteredNotifications = [];

  Future<void> getNotifications(BuildContext context) async {
    clearNotifications();
    var url = Uri.https(Constants.baseUrl, EndPoints.getNotifications);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    print(context.read<AuthProvider>().userData!.userId);

    setIsLoading(true);
    var response = await http.get(url, headers: headers);
    setIsLoading(false);

    if (response.statusCode == 200) {
      notifications = ResponseData.fromJson(json.decode(response.body)).data;
      filterNotificationsByUser(context);
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      print("Failed to fetch buses: ${errorModel.message}");
    }
  }

  void filterNotificationsByUser(BuildContext context) {
    final userId = context.read<AuthProvider>().userData!.userId.toString();
    filteredNotifications = notifications.where((notification) {
      return notification.isFavorite.contains(userId);
    }).toList();
    notifyListeners();
  }

  Future<void> deleteNotifications(BuildContext context,notId) async {
    var url = Uri.https(Constants.baseUrl, EndPoints.deleteNotifications,{"id":notId});
    final Map<String, String> headers = {'Content-Type': 'application/json'};


    setIsDelLoading(true);
    var response = await http.delete(url, headers: headers);
    setIsDelLoading(false);

    if (response.statusCode == 200) {
      showToast("Deleted successfully!").show(context);
      getNotifications(context);
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      print("Failed to fetch buses: ${errorModel.message}");
    }
  }
}
