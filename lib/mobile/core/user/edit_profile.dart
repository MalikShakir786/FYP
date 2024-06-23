import 'package:flutter/material.dart';
import 'package:fyp/utils/constants.dart';

import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../global/global_widgets/fyp_textfield.dart';
import 'change_password.dart';

class EditProfile extends StatefulWidget {
 EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
 var nameController = TextEditingController();

 var emailController = TextEditingController();

 bool isButtonDisabled = true;

 void _updateButtonState() {
   setState(() {
     isButtonDisabled = nameController.text.isEmpty && emailController.text.isEmpty;
   });
 }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        contentPadding: EdgeInsets.all(20),
        backgroundColor: Colors.white,
        content: Container(
         height: 300,
          child: Column(
            children: [
              Stack(
                children: [
                  Center(child: FypText(
                    text: "Edit Profile",
                    color: primaryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        height: 12,
                        width: 12,
                        FypIcons.cross,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              FypTextField(
                onChange: (value)=> _updateButtonState(),
                labelText: "Username",
                labelColor: Colors.black,
                controller: nameController,
              ),
              SizedBox(height: 10,),
              FypTextField(
                onChange: (value) => _updateButtonState(),
                labelText: "Email",
                labelColor: Colors.black,
                controller: emailController,
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ChangePassword()));
                  },
                  child: FypText(
                    text: "Change password?",
                    color: primaryColor,
                    fontSize: 10,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              FypButton(text: "Update",
                  isDisabled: isButtonDisabled,
                  onTap: (){})
            ],
          ),
        ),
      ),
    );
  }
}
