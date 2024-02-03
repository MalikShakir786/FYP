import 'package:flutter/material.dart';
import 'package:fyp/boarding/fyp_boarding_screen.dart';
import 'package:fyp/core/home/home_screen.dart';
import 'package:fyp/utils/constants.dart';


class FypSplashScreen extends StatefulWidget {
  const FypSplashScreen({super.key});

  @override
  State<FypSplashScreen> createState() => _FypSplashScreenState();
}

class _FypSplashScreenState extends State<FypSplashScreen> {

  bool isAnimate = false;

  @override
  void initState() {
    super.initState();
    moveToMain();
  }

  void moveToMain() async{
    Future.delayed(Duration(milliseconds: 500),(){
      isAnimate = true;
    });

    await Future.delayed(Duration(milliseconds: 2500),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FypBoardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        child: Center(
          child: AnimatedContainer(
            height: isAnimate? 200:100,
              duration: Duration(seconds: 1),
              curve: Curves.bounceOut,
              child: Image.asset(FypImages.splashImage)),
        ),
      )
    );
  }
}
