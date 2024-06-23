import 'package:flutter/material.dart';
import 'package:fyp/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../global/global_providers/auth_provider.dart';
import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_navbar.dart';
import '../../../global/global_widgets/fyp_textfield.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  String? _errorCurrentPassword;
  String? _errorNewPassword;
  String? _errorConfirmPassword;


  void _validateAndChangePassword() {
    setState(() {
      _errorCurrentPassword = context.read<AuthProvider>().cCurrentPasswordController.text.isEmpty
          ? 'Please enter current password'
          :null;
      _errorNewPassword = context.read<AuthProvider>().cNewPasswordController.text.isEmpty
          ? 'Please enter new password'
          : (context.read<AuthProvider>().cNewPasswordController.text.length < 6
          ? 'Password must be at least 6 characters long'
          : null);
      _errorConfirmPassword = context.read<AuthProvider>().cConfirmPasswordController.text.isEmpty
          ? 'Please confirm your password'
          : (context.read<AuthProvider>().cConfirmPasswordController.text != context.read<AuthProvider>().cNewPasswordController.text
          ? 'Passwords do not match'
          : null);
    });

    if (_errorCurrentPassword == null &&
        _errorNewPassword == null &&
        _errorConfirmPassword == null) {
      context.read<AuthProvider>().changePassword(context);
      FocusScope.of(context).unfocus();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FypNavBar(title: "Change Password"),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    FypTextField(
                      controller: context.read<AuthProvider>().cCurrentPasswordController,
                      labelText: "Current Password",
                      labelColor: Colors.black,
                      hintText: "Current Password",
                      prefixIcon: Icon(Icons.lock, color: primaryColor),
                      errorText: _errorCurrentPassword,
                    ),
                    SizedBox(height: 30),
                    FypTextField(
                      controller: context.read<AuthProvider>().cNewPasswordController,
                      labelText: "New Password",
                      labelColor: Colors.black,
                      hintText: "New Password",
                      prefixIcon: Icon(Icons.lock, color: primaryColor),
                      errorText: _errorNewPassword,
                    ),
                    SizedBox(height: 10),
                    FypTextField(
                      controller: context.read<AuthProvider>().cConfirmPasswordController,
                      labelText: "Confirm Password",
                      labelColor: Colors.black,
                      hintText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock, color: primaryColor),
                      errorText: _errorConfirmPassword,
                    ),
                    SizedBox(height: 40),
                    FypButton(
                      isLoading: context.watch<AuthProvider>().isLoading,
                      text: "Change",
                      onTap: (){
                        _validateAndChangePassword();
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
