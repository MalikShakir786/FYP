import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/mobile/global_widgets/dropdown_field.dart';
import '../mobile/global_widgets/fyp_button.dart';
import '../mobile/global_widgets/fyp_text.dart';
import '../mobile/global_widgets/fyp_textfield.dart';
import '../utils/constants.dart';
import 'fyp_login_screen.dart';

class FypSignUpScreen extends StatefulWidget {
  FypSignUpScreen({super.key});

  @override
  State<FypSignUpScreen> createState() => _FypSignUpScreenState();
}

class _FypSignUpScreenState extends State<FypSignUpScreen> {
  List<String> userTypes = ["Admin", "Student"];

  String selectedUserType = "Admin";

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
                      height: 460,
                      width: currentWidth > 420 ? 400 : double.infinity,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                            SizedBox(
                              height: 10,
                            ),
                            FypTextField(
                              labelText: "UOG Email",
                              prefixIcon: Icon(
                                Icons.email,
                                color: primaryColor,
                              ),
                              suffixText: "@uog.edu.pk",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FypTextField(
                              labelText: "Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: primaryColor,
                              ),
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FypTextField(
                              labelText: "Confirm Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: primaryColor,
                              ),
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              child: DropDownMenu(
                                title: "User Type",
                                itemList: userTypes,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            FypButton(
                              text: "Sign Up",
                              onTap: () {},
                            )
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
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FypLoginScreen()));
                          },
                          child: FypText(
                            text: "Sign In",
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
