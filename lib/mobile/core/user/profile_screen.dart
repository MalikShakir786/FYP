import 'package:flutter/material.dart';
import 'package:fyp/auth/fyp_login_screen.dart';
import 'package:fyp/utils/constants.dart';

import '../../../global/global_widgets/fyp_button.dart';
import '../../../global/global_widgets/fyp_text.dart';
import 'about_us_screen.dart';
import 'edit_profile.dart';
import 'get_support.dart';
import 'help.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 0,
                ),
                child: Row(
                  children: [
                    FypText(
                      text: "Settings",
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      UserInfoWidget(
                        onPressed: () {
                          showDialog(
                              barrierDismissible: false,
                              barrierColor: Colors.black26,
                              context: context,
                              builder: (BuildContext context) {
                                return EditProfile();
                              });
                        },
                      ),
                      const SizedBox(height: 16),
                      SettingsRowWidget(
                        icon: FypIcons.getHelp,
                        title: "Help",
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Help()));
                        },
                      ),
                      SettingsRowWidget(
                        icon: FypIcons.support,
                        title: "Get Support",
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> GetSupport()));
                        },
                      ),
                      SettingsRowWidget(
                        icon: FypIcons.aboutApp,
                        title: "About This App",
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutUsScreen()));
                        },
                      ),
                      const SizedBox(height: 24),
                      FypButton(text: "Logout", onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  FypLoginScreen()));
                      }),
                      const SizedBox(height: 24),
                      Text(
                        "Terms of Service",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: primaryColor),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Version (1.0.1)",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Center(
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 1.0,
                ),
              ),
              child: ClipOval(
                  child: Image.asset(
                FypImages.bannerImage1,
                fit: BoxFit.contain,
                width: 56,
                height: 56,
              )),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shakir",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "View and edit profile",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Image.asset(
            FypIcons.edit,
            fit: BoxFit.contain,
            width: 18,
            height: 18,
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}

class SettingsRowWidget extends StatefulWidget {
  SettingsRowWidget({
    super.key,
    required this.icon,
    required this.title,
    this.isCoins = false,
    this.coinsCount = 100,
    this.isDarkMode = false,
    this.isToggled = false,
    required this.onPressed,
  });

  final String icon;
  final String title;
  final bool isCoins;
  final int coinsCount;
  final bool isDarkMode;
  bool isToggled;
  final void Function() onPressed;

  @override
  State<SettingsRowWidget> createState() => _SettingsRowWidgetState();
}

class _SettingsRowWidgetState extends State<SettingsRowWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: widget.isDarkMode ? 6 : 18),
          child: Row(
            children: [
              Image.asset(
                widget.icon,
                fit: BoxFit.contain,
                width: 24,
                height: 24,
                color: primaryColor,
              ),
              const SizedBox(width: 16),
              Text(
                widget.title,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 17,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              if (widget.isDarkMode)
                Switch(
                  activeColor: Theme.of(context).colorScheme.secondary,
                  activeTrackColor: primaryColor,
                  value: widget.isToggled,
                  onChanged: (value) {
                    setState(() {});
                  },
                )
              else
                Image.asset(
                  FypIcons.chevronLeft,
                  fit: BoxFit.contain,
                  width: 15,
                  height: 15,
                  color: Theme.of(context).colorScheme.secondary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
