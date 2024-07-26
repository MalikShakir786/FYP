import 'package:flutter/material.dart';
import 'package:fyp/global/global_providers/auth_provider.dart';
import 'package:fyp/global/global_providers/user_provider.dart';
import '../../../../global/global_widgets/confirmation_alert.dart';
import '../../../../global/global_widgets/fyp_text.dart';
import '../../../../utils/constants.dart';
import 'package:provider/provider.dart';

class UserCard extends StatefulWidget {
  UserCard({
    super.key,
    required this.email,
    required this.name,
    required this.userId,
    this.isAdmin = false,
  });

  final String email;
  final String name;
  final int userId;
  bool isAdmin;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        bool isVerticalLayout = constraints.maxWidth < 420;

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: isVerticalLayout
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        FypImages.userAvatar,
                        height: 30,
                        width: 30,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FypText(
                          text: widget.email,
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        FypText(
                          text: widget.name,
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        FypText(
                          text: "Admin",
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        Checkbox(
                          value: widget.isAdmin,
                          onChanged: (value) {
                            setState(() {
                              showDialog(
                                barrierDismissible: false,
                                barrierColor: Colors.black26,
                                context: context,
                                builder: (BuildContext context) {
                                  return ConfirmationAlert(
                                    isLoading: context.watch<AuthProvider>().isLoading,
                                    title: "Admin?",
                                    subTitle: "Do you want to change this user type?",
                                    onTap: () async {
                                      await context.read<AuthProvider>().updateUser(
                                        context,
                                        widget.userId,
                                        widget.name,
                                        widget.isAdmin,
                                      );
                                      Navigator.pop(context);
                                      context.read<UserProvider>().getUsers(context);
                                    },
                                  );
                                },
                              );
                            });
                          },
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          barrierDismissible: false,
                          barrierColor: Colors.black26,
                          context: context,
                          builder: (BuildContext context) {
                            return ConfirmationAlert(
                              isLoading: context.watch<UserProvider>().isDelLoading,
                              title: "Delete?",
                              subTitle: "Do you want to delete this user?",
                              onTap: () async{
                                await context.read<UserProvider>().deleteUser(
                                    context,
                                    widget.email
                                );
                                Navigator.pop(context);
                                context.read<UserProvider>().getUsers(context);
                              },
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.delete,
                        size: 24,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        FypImages.userAvatar,
                        height: 30,
                        width: 30,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FypText(
                          text: widget.email,
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        FypText(
                          text: widget.name,
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        FypText(
                          text: "Admin",
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        Checkbox(
                          value: widget.isAdmin,
                          onChanged: (value) {
                            setState(() {
                              showDialog(
                                barrierDismissible: false,
                                barrierColor: Colors.black26,
                                context: context,
                                builder: (BuildContext context) {
                                  return ConfirmationAlert(
                                    isLoading: context.watch<AuthProvider>().isLoading,
                                    title: "Admin?",
                                    subTitle: "Do you want to change this user type?",
                                    onTap: () async {
                                      await context.read<AuthProvider>().updateUser(
                                        context,
                                        widget.userId,
                                        widget.name,
                                        widget.isAdmin,
                                      );
                                      Navigator.pop(context);
                                      context.read<UserProvider>().getUsers(context);
                                    },
                                  );
                                },
                              );
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          barrierDismissible: false,
                          barrierColor: Colors.black26,
                          context: context,
                          builder: (BuildContext context) {
                            return ConfirmationAlert(
                              isLoading: context.watch<UserProvider>().isLoading,
                              title: "Delete?",
                              subTitle: "Do you want to delete this user?",
                              onTap: () async{
                                await context.read<UserProvider>().deleteUser(
                                    context,
                                    widget.email
                                );
                                Navigator.pop(context);
                                context.read<UserProvider>().getUsers(context);
                              },
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.delete,
                        size: 24,
                        color: primaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
