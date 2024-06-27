import 'dart:convert';
import 'package:flutter/material.dart';

import '../../../../global/global_models/error_model.dart';
import '../../../../global/global_widgets/toast_message.dart';
import '../../../../utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../global_models/feedback_model.dart';

class FeedBackProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<FeedbackItem> _feedbackList = [];

  bool get isLoading => _isLoading;

  List<FeedbackItem> get feedbackList => _feedbackList;

  void clearList(){
    _feedbackList = [];
  }

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

  // Clear fields
  void clearFields() {
    fEmailController.clear();
    fTitleController.clear();
    fDescriptionController.clear();
  }

  // Feedback controllers
  var fEmailController = TextEditingController();
  var fTitleController = TextEditingController();
  var fDescriptionController = TextEditingController();

  // Insert Feedback method
  Future<void> insertFeedback(BuildContext context) async {
    var url = Uri.https(Constants.baseUrl, EndPoints.insertFeedback);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final body = {
      "title": fTitleController.text.trim(),
      "review": fDescriptionController.text.trim(),
      "user_email": fEmailController.text.trim(),
    };

    setIsLoading(true);
    var response = await http.post(
        url, headers: headers, body: json.encode(body));
    setIsLoading(false);

    print(response.statusCode);

    if (response.statusCode == 200) {
      showToast("Feedback submitted successfully!").show(context);
      clearFields();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
    }
  }

  // Get Feedback method
  Future<void> getFeedback(BuildContext context) async {
    var url = Uri.https(Constants.baseUrl, EndPoints.showFeedback);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    setIsLoading(true);
    var response = await http.get(url, headers: headers);
    setIsLoading(false);

    print(response.statusCode);

    if (response.statusCode == 200) {
      clearList();
      var result = FeedbackResponse.fromJson(json.decode(response.body));
      _feedbackList = result.data;
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
      notifyListeners();
    }
  }

  //Search Feedback

  var fEmailSearchController = TextEditingController();
  var fTitleSearchController = TextEditingController();

  Future<void> searchFeedback(BuildContext context) async {

    var url = Uri.https(Constants.baseUrl, EndPoints.searchFeedback);
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final Map<String, String> body = {
      "title": fTitleSearchController.text.trim(),
      "user_email": fEmailSearchController.text.trim(),
    };

    setIsLoading(true);
    var response = await http.post(url, headers: headers,body: json.encode(body));
    setIsLoading(false);

    print(response.statusCode);

    if (response.statusCode == 200) {
      clearList();
      var result = FeedbackResponse.fromJson(json.decode(response.body));
      _feedbackList = result.data;
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      // showToast(errorModel.message).show(context);
      notifyListeners();
    }
  }

  Future<void> deleteFeedback(BuildContext context,String feedbackId) async {


    var url = Uri.https(Constants.baseUrl, EndPoints.deleteFeedback,{"id": feedbackId});
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    
    setIsDelLoading(true);
    var response = await http.delete(url, headers: headers);
    setIsDelLoading(false);
    print(response.statusCode);

    if (response.statusCode == 200) {
      clearList();
      getFeedback(context);
      showToast("Deleted successfully!").show(context);
      notifyListeners();
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
      notifyListeners();
    }
  }

}