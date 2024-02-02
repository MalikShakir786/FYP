import 'package:flutter/material.dart';
import 'package:fyp/core/auth/fyp_login_screen.dart';
import 'package:fyp/global_widgets/fyp_button.dart';
import 'package:fyp/global_widgets/fyp_navbar.dart';
import 'package:fyp/global_widgets/fyp_text.dart';
import 'package:fyp/utils/constants.dart';

import '../core/auth/fyp_signup_screen.dart';

class FypBoardingScreen extends StatelessWidget {
  const FypBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "Image",
                child: FypText(
                  text: "Find Your Routes!",
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: primaryColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FypText(
                text: "Navigating life is like finding a best route . . . .",
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              SizedBox(height: 50,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(
                  FypImages.boardingImage,
                ),
              ),
              SizedBox(height: 50,),
              FypButton(
                text: "Get Started !",
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FypSignUpScreen()));
                },
              ),
              SizedBox(height: 20,),
              FypButton(
                buttonColor: primaryColor,
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FypLoginScreen()));
                },
                text: "Already have an account ?",
              ),
            ],
          ),
        ),
      )
    );
  }
}
