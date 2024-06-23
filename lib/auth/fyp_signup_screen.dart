import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../mobile/global_widgets/dropdown_field.dart';
import '../mobile/global_widgets/fyp_button.dart';
import '../mobile/global_widgets/fyp_text.dart';
import '../mobile/global_widgets/fyp_textfield.dart';
import '../utils/constants.dart';
import 'auth_provider/auth_provider.dart';
import 'fyp_login_screen.dart';

class FypSignUpScreen extends StatefulWidget {
  FypSignUpScreen({super.key});

  @override
  State<FypSignUpScreen> createState() => _FypSignUpScreenState();
}

class _FypSignUpScreenState extends State<FypSignUpScreen> {
  List<String> userTypes = ["Admin", "Student"];

  String? errorName;
  String? errorEmail;
  String? errorPassword;
  String? errorConfirm;

  void _validateAndSignUp(BuildContext context) {
    var authProvider = context.read<AuthProvider>();

    final emailRegex = RegExp(r'^[^@]+@uog\.edu\.pk$');
    setState(() {
      errorName = authProvider.sUserNameController.text.isEmpty
          ? "Please enter username"
          : null;
      errorEmail = authProvider.sEmailController.text.isEmpty
          ? "Please enter email"
          : (!emailRegex.hasMatch(authProvider.sEmailController.text)
              ? "Invalid email format"
              : null);
      errorPassword = authProvider.sPasswordController.text.isEmpty
          ? "Please enter password"
          : (authProvider.sPasswordController.text.length < 6
              ? "Password must be at least 6 characters long"
              : null);
      errorConfirm = authProvider.sConfirmPasswordController.text.isEmpty
          ? "Please enter confirm password"
          : (authProvider.sPasswordController.text !=
                  authProvider.sConfirmPasswordController.text
              ? "Passwords do not match"
              : null);
    });

    if (errorName == null &&
        errorEmail == null &&
        errorPassword == null &&
        errorConfirm == null) {
      authProvider.signup(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = context.read<AuthProvider>();

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
                              controller: authProvider.sUserNameController,
                              labelText: "Username",
                              prefixIcon: Icon(
                                Icons.person,
                                color: primaryColor,
                              ),
                              hintText: "Username",
                              errorText: errorName,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FypTextField(
                              controller: authProvider.sEmailController,
                              labelText: "UOG Email",
                              prefixIcon: Icon(
                                Icons.email,
                                color: primaryColor,
                              ),
                              suffixText: "@uog.edu.pk",
                              hintText: "Email",
                              errorText: errorEmail,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FypTextField(
                              controller: authProvider.sPasswordController,
                              labelText: "Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: primaryColor,
                              ),
                              hintText: "Password",
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                                color: primaryColor,
                              ),
                              errorText: errorPassword,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FypTextField(
                              controller:
                                  authProvider.sConfirmPasswordController,
                              labelText: "Confirm Password",
                              hintText: "Confirm Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: primaryColor,
                              ),
                              suffixIcon: Icon(
                                Icons.remove_red_eye,
                                color: primaryColor,
                              ),
                              errorText: errorConfirm,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            FypButton(
                              text: "Sign Up",
                              isLoading:
                                  context.watch<AuthProvider>().isLoading,
                              onTap: () {
                                _validateAndSignUp(context);
                              },
                            ),
                            SizedBox(
                              height: 10,
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
