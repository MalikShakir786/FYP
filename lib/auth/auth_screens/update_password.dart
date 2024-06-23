import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../mobile/global_widgets/fyp_button.dart';
import '../../mobile/global_widgets/fyp_text.dart';
import '../../mobile/global_widgets/fyp_textfield.dart';
import '../../utils/constants.dart';
import '../auth_provider/auth_provider.dart';


class UpdatePassword extends StatefulWidget {
  UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {

  String? errorPassword;
  String? errorConfirm;

  void _validateAndUpdate(BuildContext context) {
    var authProvider = context.read<AuthProvider>();

    setState(() {
      errorPassword = authProvider.uPasswordController.text.isEmpty
          ? "Please enter password"
          : (authProvider.uPasswordController.text.length < 6
          ? "Password must be at least 6 characters long"
          : null);
      errorConfirm = authProvider.uConfirmPasswordController.text.isEmpty
          ? "Please enter confirm password"
          : (authProvider.uPasswordController.text !=
          authProvider.uConfirmPasswordController.text
          ? "Passwords do not match"
          : null);
    });

    if (errorConfirm == null &&
        errorPassword == null) {
      authProvider.updatePassword(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Opacity(
              opacity: 0.7,
              child: Image.asset(
                FypImages.deskBgImage1,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: currentWidth>420 ? 400: double.infinity,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            FypText(
                              text: "Update Password",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            SizedBox(height: 20,),
                            FypTextField(
                              controller: context.read<AuthProvider>().uPasswordController,
                              labelText: "New Password",
                              hintText: "New Password",
                              prefixIcon: Icon(Icons.lock,color: primaryColor,),
                              errorText: errorPassword,
                            ),
                            SizedBox(height: 10,),
                            FypTextField(
                              controller: context.read<AuthProvider>().uConfirmPasswordController,
                              labelText: "Confirm Password",
                              hintText: "Confirm Password",
                              prefixIcon: Icon(Icons.lock,color: primaryColor,),
                              errorText: errorConfirm,
                            ),
                            SizedBox(height: 30,),
                            FypButton(
                              isLoading: context.watch<AuthProvider>().isLoading,
                              text: "Update", onTap: (){
                              _validateAndUpdate(context);
                            },),
                            SizedBox(height: 10,),
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: FypText(text: "< Back",
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
