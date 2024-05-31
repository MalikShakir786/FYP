import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/web/core/dashboard/dashboard_screen.dart';
import '../mobile/core/home/home_screen.dart';
import '../mobile/global_widgets/fyp_button.dart';
import '../mobile/global_widgets/fyp_text.dart';
import '../mobile/global_widgets/fyp_textfield.dart';
import '../utils/constants.dart';
import 'forgot_password_screen.dart';
import 'fyp_signup_screen.dart';


class FypLoginScreen extends StatelessWidget {
  const FypLoginScreen({super.key});

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
                      height: 320,
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
                              text: "Login",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
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
                            SizedBox(height: 20,),
                            FypButton(text: "Sign In", onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> currentWidth>=420 ? DashBoardScreen():HomeScreen()));
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
