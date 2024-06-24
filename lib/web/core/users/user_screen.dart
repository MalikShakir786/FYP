import 'package:flutter/material.dart';
import 'package:fyp/web/core/users/user_widgets/user_card.dart';

import '../../../global/global_providers/user_provider.dart';
import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../global/global_widgets/fyp_textfield.dart';
import '../../../utils/constants.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserProvider>().getUsers(context);
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final provider = context.watch<UserProvider>();

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
                        width: currentWidth * 0.4,
                        child: FypTextField(
                          onChange: (value) {
                            Future.delayed(Duration(seconds: 1), () {
                              setState(() {
                                context.read<UserProvider>().searchUser(context);
                              });
                            });
                          },
                          controller: context.read<UserProvider>().sEmailController,
                          labelText: "Email",
                          hintText: "Email",
                          labelColor: Colors.black,
                          prefixIcon: Icon(Icons.directions_bus, color: primaryColor),
                        ),
                      ),
                      SizedBox(width: 50),
                      FypButton(
                        text: "Search",
                        buttonWidth: 120,
                        onTap: () {
                          context.read<UserProvider>().searchUser(context);
                        },
                      ),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FypTextField(
                        onChange: (value) {
                          Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              context.read<UserProvider>().searchUser(context);
                            });
                          });
                        },
                        controller: context.read<UserProvider>().sEmailController,
                        labelText: "Email",
                        hintText: "Email",
                        labelColor: Colors.black,
                        prefixIcon: Icon(Icons.directions_bus, color: primaryColor),
                      ),
                      SizedBox(height: 20),
                      FypButton(
                        text: "Search",
                        onTap: () {
                          context.read<UserProvider>().searchUser(context);
                        },
                      ),
                    ],
                  );
                }
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: provider.isLoading
                  ? Center(
                child: CircularProgressIndicator(color: primaryColor),
              )
                  : provider.usersList == null ||
                  (provider.usersList!.data.admin.isEmpty &&
                      provider.usersList!.data.student.isEmpty)
                  ? Center(
                child: FypText(
                  text: "No Users Found",
                  color: Colors.black,
                  fontSize: 15,
                ),
              )
                  : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (provider.usersList!.data.admin.isNotEmpty) ...[
                      FypText(
                        text: "Admins:",
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: provider.usersList!.data.admin.map((admin) {
                          return UserCard(
                            email: admin.userEmail,
                            name: admin.userName,
                            userId: admin.userId,
                            isAdmin: true,
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                    ],
                    if (provider.usersList!.data.student.isNotEmpty) ...[
                      FypText(
                        text: "Students:",
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: provider.usersList!.data.student.map((student) {
                          return UserCard(
                            email: student.userEmail,
                            name: student.userName,
                            userId: student.userId,
                            isAdmin: false,
                          );
                        }).toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
