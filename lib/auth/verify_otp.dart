import 'package:flutter/material.dart';
import 'package:fyp/auth/update_password.dart';
import 'package:fyp/global/global_widgets/toast_message.dart';
import 'package:provider/provider.dart';
import '../../utils/constants.dart';
import '../global/global_providers/auth_provider.dart';
import '../global/global_widgets/fyp_button.dart';
import '../global/global_widgets/fyp_text.dart';
import '../global/global_widgets/fyp_textfield.dart';



class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {

  String? errorForget;
  var otpController = TextEditingController();

  void _validateAndNavigate(BuildContext context) {
    var authProvider = context.read<AuthProvider>();
    setState(() {
      errorForget = otpController.text.isEmpty
          ? "Please enter OTP"
          :null;
    });

    if (errorForget == null) {
      if(otpController.text == context.read<AuthProvider>().otp){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdatePassword()));
        otpController.clear();
      }else{
        showToast("* Incorrect OTP *").show(context);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
          otpController.text =
              context.read<AuthProvider>().otp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
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
                              text: "Verify OTP",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            SizedBox(height: 10,),
                            FypTextField(
                              keyboard: TextInputType.number,
                              controller: otpController,
                              labelText: "OTP",
                              hintText: "6 digits OTP",
                              prefixIcon: Icon(Icons.password,color: primaryColor,),
                              errorText: errorForget,
                            ),
                            SizedBox(height: 30,),
                            FypButton(text: "Verify", onTap: (){
                              _validateAndNavigate(context);
                              print(context.read<AuthProvider>().updateEmail);
                            },),
                            SizedBox(height: 20,),
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: FypText(text: "< Back",
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
