import 'package:flutter/material.dart';
import 'package:fyp/global/global_providers/user_provider.dart';
import 'package:fyp/utils/constants.dart';
import 'fyp_splash_screen.dart';
import 'package:provider/provider.dart';

import 'global/global_providers/auth_provider.dart';
import 'global/global_providers/bus_provider.dart';
import 'global/global_providers/feedback_provider.dart';
import 'global/global_providers/find_bus_provider.dart';

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
        ),ChangeNotifierProvider(
          create: (_) => UserProvider(),
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

