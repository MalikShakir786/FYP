import 'package:flutter/material.dart';
import 'package:fyp/utils/constants.dart';

import 'fyp_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FYPTheme.lightThemeData(context),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: FypSplashScreen(),
    );
  }
}

