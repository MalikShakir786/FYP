import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/global/global_models/user_list_model.dart';
import 'package:fyp/global/global_widgets/toast_message.dart';

import '../../global/global_models/error_model.dart';
import '../../utils/constants.dart';
import 'package:http/http.dart' as http;

import '../global_models/otp_model.dart';
import '../global_models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  var confirmPasswordController = TextEditingController();

  //SignUp
  var sUserNameController = TextEditingController();
  var sEmailController = TextEditingController();
  var sPasswordController = TextEditingController();
  var sConfirmPasswordController = TextEditingController();
  var _sUserType = "Student";

  String get sUserType => _sUserType;

  void setSUserType(String value) {
    _sUserType = value;
    notifyListeners();
  }

  void clearFields() {
    sUserNameController.clear();
    sEmailController.clear();
    sPasswordController.clear();
    sConfirmPasswordController.clear();
    _sUserType = "Student";
    lEmailController.clear();
    lPasswordController.clear();
    _lUserType = "";
    fEmailController.clear();
    uPasswordController.clear();
    uConfirmPasswordController.clear();
    cCurrentPasswordController.clear();
    cNewPasswordController.clear();
    cConfirmPasswordController.clear();
  }

  Future<void> signup(
    BuildContext context,
  ) async {
    var url = Uri.https(
      Constants.baseUrl,
      EndPoints.signup,
    );
    print(url.toString());

    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final body = {
      "user_email": sEmailController.text.trim(),
      "user_name": sUserNameController.text.trim(),
      "user_password": sPasswordController.text.trim(),
      "user_type": sUserType,
    };

    setIsLoading(true);
    var response = await http.post(
      url,
      headers: headers,
      body: json.encode(body),
    );
    setIsLoading(false);
    print(response.statusCode);
    print(body);

    if (response.statusCode == 201) {
      clearFields();
      showToast("Account created successfully!").show(context);
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
    }
  }

  //Login
  var lEmailController = TextEditingController();
  var lPasswordController = TextEditingController();
  var _lUserType = "";

  String get lUserType => _lUserType;

  void clearLoginFields() {
    lEmailController.clear();
    lPasswordController.clear();
  }

  UserData? userData;

  Future<bool> login(
    BuildContext context,
  ) async {
    var url = Uri.https(
      Constants.baseUrl,
      EndPoints.login,
    );
    print(url.toString());

    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final body = {
      "user_email": lEmailController.text.trim(),
      "user_password": lPasswordController.text.trim(),
    };

    setIsLoading(true);
    var response = await http.post(
      url,
      headers: headers,
      body: json.encode(body),
    );
    setIsLoading(false);

    print(response.statusCode);

    if (response.statusCode == 200) {
      clearFields();
      var result = UserModel.fromJson(json.decode(response.body));
      userData = result.data;
      return true;
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
      return false;
    }
  }

  // Forget Password
  var fEmailController = TextEditingController();
  String? _updateEmail;

  String? get updateEmail => _updateEmail;

  void setUpdateEmail(String? value) {
    _updateEmail = value;
    notifyListeners();
  }

  var otp;

  Future<bool> forget(
    BuildContext context,
  ) async {
    var url = Uri.https(
      Constants.baseUrl,
      EndPoints.forget,
    );
    print(url.toString());

    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final body = {
      "user_email": fEmailController.text.trim(),
    };

    setIsLoading(true);
    var response = await http.post(
      url,
      headers: headers,
      body: json.encode(body),
    );
    setIsLoading(false);

    if (response.statusCode == 200) {
      var result = OtpModel.fromJson(json.decode(response.body));
      otp = result.otp.toString();
      return true;
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
      return false;
    }
  }

  //Update
  var uPasswordController = TextEditingController();
  var uConfirmPasswordController = TextEditingController();

  Future<void> updatePassword(
    BuildContext context,
  ) async {
    var url = Uri.https(
      Constants.baseUrl,
      EndPoints.updatePassword,
    );
    print(url.toString());

    final Map<String, String> headers = {'Content-Type': 'application/json'};

    print(updateEmail);

    final body = {
      "user_email": updateEmail,
      "new_password": uPasswordController.text.trim(),
    };

    print(body);

    setIsLoading(true);
    var response = await http.put(
      url,
      headers: headers,
      body: json.encode(body),
    );
    setIsLoading(false);

    print(response.statusCode);

    if (response.statusCode == 200) {
      clearFields();
      showToast("Password updated successfully!").show(context);
      _updateEmail = "";
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
    }
  }

  //Change Password
  var cCurrentPasswordController = TextEditingController();
  var cNewPasswordController = TextEditingController();
  var cConfirmPasswordController = TextEditingController();

  Future<void> changePassword(
    BuildContext context,
  ) async {
    var url = Uri.https(
      Constants.baseUrl,
      EndPoints.changePassword,
    );
    print(url.toString());

    final Map<String, String> headers = {'Content-Type': 'application/json'};


    final body = {
      "user_id": userData!.userId,
      "current_password": cCurrentPasswordController.text.trim(),
      "new_password": cNewPasswordController.text.trim(),
    };

    print(body);

    setIsLoading(true);
    var response = await http.put(
      url,
      headers: headers,
      body: json.encode(body),
    );
    setIsLoading(false);

    if (response.statusCode == 200){
      clearFields();
      showToast("Password updated successfully!").show(context);
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
    }
  }

  //Update User

  var uEmailController  = TextEditingController();
  var uUserController  = TextEditingController();

  Future<bool> updateUser(BuildContext context, int userId, String userName, bool isAdmin) async {
    var url = Uri.https(
      Constants.baseUrl,
      EndPoints.updateUser,
    );
    print(url.toString());

    final Map<String, String> headers = {'Content-Type': 'application/json'};

    // Determine the user type based on the isAdmin flag
    String updatedUserType = isAdmin ? 'student' : 'admin';

    final body = {
      "user_id": userId,
      "user_name": userName,
      "user_type": updatedUserType,
    };
    print(body);

    setIsLoading(true);
    var response = await http.put(
      url,
      headers: headers,
      body: json.encode(body),
    );
    setIsLoading(false);

    if (response.statusCode == 200) {
      showToast("Updated successfully!").show(context);
      userData!.userName = userName;
      return true;
    } else {
      var errorModel = ErrorModel.fromJson(json.decode(response.body));
      showToast(errorModel.message).show(context);
      return false;
    }
  }

}
