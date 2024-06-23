import 'package:flutter/material.dart';
import '../../../../global/global_widgets/confirmation_alert.dart';
import '../../../../global/global_widgets/fyp_text.dart';
import '../../../../utils/constants.dart';

class UserCard extends StatefulWidget {
  UserCard({
    super.key,
    required this.email,
    required this.name,
    this.isAdmin = false
  });

  final String email;
  final String name;
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
                    SizedBox(width: 10,),
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
                        )
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
                                    title: "Admin?",
                                    subTitle: "Do you want to change this user type?",
                                    onTap: (){},
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
                              title: "Delete?",
                              subTitle: "Do you want to delete this user?",
                              onTap: (){},
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
                    SizedBox(width: 10,),
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
                        )
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
                                    title: "Admin?",
                                    subTitle: "Do you want to change this user type?",
                                    onTap: (){},
                                  );
                                },
                              );
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          barrierDismissible: false,
                          barrierColor: Colors.black26,
                          context: context,
                          builder: (BuildContext context) {
                            return ConfirmationAlert(
                              title: "Delete?",
                              subTitle: "Do you want to delete this user?",
                              onTap: (){},
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
