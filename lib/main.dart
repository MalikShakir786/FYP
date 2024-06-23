import 'package:flutter/material.dart';
import 'package:fyp/auth/auth_provider/auth_provider.dart';
import 'package:fyp/boarding/bus_provider.dart';
import 'package:fyp/mobile/core/bus_find/find_bus_provider/find_bus_provider.dart';
import 'package:fyp/utils/constants.dart';
import 'fyp_splash_screen.dart';
import 'package:provider/provider.dart';

import 'web/core/feedback/feedback_provider/feedback_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FindBusProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BusProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FeedBackProvider(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: FYPTheme.lightThemeData(context),
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: FypSplashScreen(),
          );
        }
      ),
    );
  }
}

