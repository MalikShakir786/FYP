import 'package:flutter/material.dart';
import 'package:fyp/core/auth/forgot_password_screen.dart';
import 'package:fyp/core/auth/fyp_signup_screen.dart';
import 'package:fyp/core/bus_find/find_bus_screen.dart';
import 'package:fyp/global_widgets/fyp_button.dart';
import 'package:fyp/global_widgets/fyp_text.dart';
import 'package:fyp/global_widgets/fyp_textfield.dart';
import 'package:fyp/utils/constants.dart';

class FypLoginScreen extends StatelessWidget {
  const FypLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Opacity(
              opacity: 0.4,
              child: Image.asset(
                FypImages.bgImage,
                fit: BoxFit.fill,
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
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: primaryColor,
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
                              text: "Login",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            SizedBox(height: 10,),
                            FypTextField(
                              labelText: "UOG Email",
                              prefixIcon: Icon(Icons.email,color: primaryColor,),
                              suffixText: "@uog.edu.pk",
                            ),
                            SizedBox(height: 10,),
                            FypTextField(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock,color: primaryColor,),
                              suffixIcon: Icon(Icons.remove_red_eye,color: primaryColor,),
                            ),
                            SizedBox(height: 10,),
                            Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPasswordScreen()));
                                  },
                                  child: FypText(
                                    text: "Forgotten Password ?",
                                    fontSize: 12,
                                    textDecoration: TextDecoration.underline,
                                  ),
                                )),
                            SizedBox(height: 30,),
                            FypButton(text: "Sign In", onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> FindBusScreen()));
                            },)
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FypText(
                            text: "Don't have an account ?  ",
                          color: Colors.black,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FypSignUpScreen()));
                          },
                          child: FypText(text: "Sign Up",
                          color: primaryColor,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            decorationColor: primaryColor,
                            textDecoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    )
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
