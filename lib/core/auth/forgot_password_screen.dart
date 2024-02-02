import 'package:flutter/material.dart';

import '../../global_widgets/fyp_button.dart';
import '../../global_widgets/fyp_text.dart';
import '../../global_widgets/fyp_textfield.dart';
import '../../utils/constants.dart';
import 'fyp_signup_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                child: Container(
                  height: 300,
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
                          text: "Forgotten Password",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        SizedBox(height: 20,),
                        FypTextField(
                          labelText: "UOG Email",
                          prefixIcon: Icon(Icons.email,color: primaryColor,),
                          suffixText: "@uog.edu.pk",
                        ),
                        SizedBox(height: 30,),
                        FypButton(text: "Send Code", onTap: (){},),
                        SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: FypText(text: "< Back",
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            textDecoration: TextDecoration.underline
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
