import 'package:flutter/material.dart';
import 'package:fyp/core/auth/fyp_login_screen.dart';

import '../../global_widgets/fyp_button.dart';
import '../../global_widgets/fyp_text.dart';
import '../../global_widgets/fyp_textfield.dart';
import '../../utils/constants.dart';
import 'forgot_password_screen.dart';

class FypSignUpScreen extends StatelessWidget {
  const FypSignUpScreen({super.key});

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
                      height: 500,
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
                              text: "Sign Up",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            SizedBox(height: 10,),
                            FypTextField(
                              labelText: "Username",
                              prefixIcon: Icon(Icons.person,color: primaryColor,),
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
                            FypTextField(
                              labelText: "Confirm Password",
                              prefixIcon: Icon(Icons.lock,color: primaryColor,),
                              suffixIcon: Icon(Icons.remove_red_eye,color: primaryColor,),
                            ),
                            SizedBox(height: 30,),
                            FypButton(text: "Sign Up", onTap: (){},)
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FypText(
                          text: "Already have an account ?  ",
                          color: Colors.black,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FypLoginScreen()));
                          },
                          child: FypText(text: "Sign In",
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
