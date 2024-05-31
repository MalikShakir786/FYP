import 'package:flutter/material.dart';

import '../mobile/global_widgets/fyp_button.dart';
import '../mobile/global_widgets/fyp_text.dart';
import '../mobile/global_widgets/fyp_textfield.dart';
import '../utils/constants.dart';



class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: 270,
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
