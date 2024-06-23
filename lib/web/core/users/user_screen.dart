import 'package:flutter/material.dart';
import 'package:fyp/web/core/users/user_widgets/user_card.dart';
import '../../../../utils/constants.dart';
import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../global/global_widgets/fyp_textfield.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: primaryColor,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              FypText(
                text: "Users",
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 420) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: currentWidth*0.4,
                          child: FypTextField(
                            labelText: "Email",
                            hintText: "Email",
                            labelColor: Colors.black,
                            prefixIcon: Icon(Icons.directions_bus, color: primaryColor),
                          ),
                        ),
                        SizedBox(width: 50),
                        FypButton(text: "Search", buttonWidth: 120, onTap: () {
                          // Handle search action
                        }),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FypTextField(
                          labelText: "Bus Number",
                          hintText: "Bus Number",
                          labelColor: Colors.black,
                          prefixIcon: Icon(Icons.directions_bus, color: primaryColor),
                        ),
                        SizedBox(height: 20),
                        FypButton(text: "Search", onTap: () {
                          // Handle search action
                        }),
                        SizedBox(height: 10),
                      ],
                    );
                  }
                },
              ),
              SizedBox(height: 10,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FypText(
                            text: "Admins:",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: List.generate(4, (index) {
                              return UserCard(
                                email: "20011556-048@uog.edu.pk",
                                name: "Shakir",
                                isAdmin: true,
                              );
                            }),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FypText(
                            text: "Others:",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: List.generate(10, (index) {
                              return UserCard(
                                email: "20011556-048@uog.edu.pk",
                                name: "Shakir",
                                isAdmin: false,
                              );
                            }),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
