import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/web/core/dashboard/dashboard_screen.dart';
import '../global/global_providers/auth_provider.dart';
import '../global/global_widgets/fyp_button.dart';
import '../global/global_widgets/fyp_text.dart';
import '../global/global_widgets/fyp_textfield.dart';
import '../mobile/core/home_screen.dart';
import '../utils/constants.dart';
import 'forgot_password_screen.dart';
import 'fyp_signup_screen.dart';
import 'package:provider/provider.dart';


class FypLoginScreen extends StatefulWidget {
  FypLoginScreen({super.key});

  @override
  State<FypLoginScreen> createState() => _FypLoginScreenState();
}

class _FypLoginScreenState extends State<FypLoginScreen> {
  String? errorEmail;

  String? errorPassword;

  void _validateAndLogIn(BuildContext context) async{
    var authProvider = context.read<AuthProvider>();

    final emailRegex = RegExp(r'^[^@]+@uog\.edu\.pk$');
    setState(() {
      errorEmail = authProvider.lEmailController.text.isEmpty
          ? "Please enter email"
          : (!emailRegex.hasMatch(authProvider.lEmailController.text)
          ? "Invalid email format"
          : null);
      errorPassword = authProvider.lPasswordController.text.isEmpty
          ? "Please enter password"
          : (authProvider.lPasswordController.text.length < 6
          ? "Password must be at least 6 characters long"
          : null);
    });

    if (errorEmail == null &&
        errorPassword == null) {
      bool isNavigate = await authProvider.login(context);
      if (isNavigate) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashBoardScreen()));
      }
    }
  }

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
                            SizedBox(height: 20,),
                            FypTextField(
                              controller: context.read<AuthProvider>().lEmailController,
                              labelText: "UOG Email",
                              prefixIcon: Icon(Icons.email,color: primaryColor,),
                              suffixText: "@uog.edu.pk",
                              errorText: errorEmail,
                            ),
                            SizedBox(height: 10,),
                            FypTextField(
                              controller: context.read<AuthProvider>().lPasswordController,
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock,color: primaryColor,),
                              suffixIcon: Icon(Icons.remove_red_eye,color: primaryColor,),
                              errorText: errorPassword,
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
                            FypButton(
                              isLoading: context.watch<AuthProvider>().isLoading,
                              text: "Sign In", onTap: (){
                              // _validateAndLogIn(context);
                              Navigator.pushReplacement(
                                  context, MaterialPageRoute(builder: (context) => HomeScreen()));
                            },),
                            SizedBox(height: 10,),
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
