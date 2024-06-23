import 'package:flutter/material.dart';
import 'package:fyp/auth/auth_provider/auth_provider.dart';
import 'package:fyp/auth/auth_screens/verify_otp.dart';

import '../mobile/global_widgets/fyp_button.dart';
import '../mobile/global_widgets/fyp_text.dart';
import '../mobile/global_widgets/fyp_textfield.dart';
import '../utils/constants.dart';
import 'package:provider/provider.dart';



class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  String? errorForget;

  void _validateAndGetOtp(BuildContext context) async{
    var authProvider = context.read<AuthProvider>();

    final emailRegex = RegExp(r'^[^@]+@uog\.edu\.pk$');
    setState(() {
      errorForget = authProvider.fEmailController.text.isEmpty
          ? "Please enter email"
          : (!emailRegex.hasMatch(authProvider.fEmailController.text)
          ? "Invalid email format"
          : null);
    });

    if (errorForget == null) {
      bool isNavigate = await authProvider.forget(context);
      if(isNavigate){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyOTPScreen()));
      }
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
                        color: primaryColor.withOpacity(0.4),
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
                              text: "Forgotten Password",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            SizedBox(height: 20,),
                            FypTextField(
                              controller: context.read<AuthProvider>().fEmailController,
                              labelText: "UOG Email",
                              prefixIcon: Icon(Icons.email,color: primaryColor,),
                              suffixText: "@uog.edu.pk",
                              errorText: errorForget,
                            ),
                            SizedBox(height: 30,),
                            FypButton(
                              isLoading: context.watch<AuthProvider>().isLoading,
                              text: "Send Code", onTap: (){
                              context.read<AuthProvider>().setUpdateEmail(context.read<AuthProvider>().fEmailController.text.trim().toString());
                              _validateAndGetOtp(context);
                            },),
                            SizedBox(height: 20,),
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
