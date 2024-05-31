import 'package:flutter/material.dart';
import 'package:fyp/boarding/on_boarding_screen.dart';
import 'package:fyp/utils/constants.dart';
import 'package:fyp/web/core/bus_info_screen/bus_info_screen.dart';
import 'package:fyp/web/core/dashboard/dashboard_screen.dart';
import 'auth/fyp_login_screen.dart';



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
    moveToMain(context);
  }

  void moveToMain(BuildContext context) async{
    Future.delayed(Duration(milliseconds: 500),(){
      isAnimate = true;
    });

    await Future.delayed(Duration(milliseconds: 2500),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusInfoScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: AnimatedContainer(
            height: isAnimate? 120:80,
              duration: Duration(seconds: 1),
              curve: Curves.bounceOut,
              child: Image.asset(FypImages.splashImage)),
        ),
      )
    );
  }
}
