import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/boarding/boarding_widgets/boarding_pages.dart';
import '../auth/fyp_login_screen.dart';
import '../auth/fyp_signup_screen.dart';
import '../global/global_widgets/fyp_button.dart';
import '../utils/constants.dart';
import 'boarding_widgets/dots_indicators.dart';

class FypOnBoardingScreen extends StatefulWidget {
  const FypOnBoardingScreen({super.key});

  @override
  State<FypOnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<FypOnBoardingScreen> {
  int currentPage = 0;

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (value) {
                          currentPage = value;
                          setState(() {});
                        },
                        children: [
                          BoardingPage(
                            title: "Explore Campus Commutes",
                            subTitle:
                                "Effortless Navigation for University Transport",
                            imagePath: "assets/images/boardingImage.png",
                          ),
                          BoardingPage(
                            title: "Campus Connections",
                            subTitle: "Navigating University Transit Hassle-Free",
                            imagePath: "assets/images/bannerImage7.jpg",
                          ),
                          BoardingPage(
                            title: "UniRoute Navigator",
                            subTitle: "Seamless Journeys Across Campus",
                            imagePath: "assets/images/bannerImage6.jpg",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            return CustomIndicator(isActive: currentPage == index);
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FypButton(
                          text: "Get Started !",
                          isDisabled: currentPage == 2 ? false : true,
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FypSignUpScreen()));
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FypButton(
                          buttonColor: primaryColor,
                          isDisabled: currentPage == 2 ? false : true,
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FypLoginScreen()));
                          },
                          text: "Already have an account ?",
                        ),
                        SizedBox(height: 20,),
                      ],
                    )),
                  ],
                ),
              ),
      ),
    );
  }
}
