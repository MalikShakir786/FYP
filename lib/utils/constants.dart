import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Primary Color
const Color primaryColor = Color(0xff152B70);

// FYP ThemeData
class FYPTheme {
  static var lightColorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
  );

// Theme for light mode
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
      primaryColor: primaryColor,
      cardColor: Colors.white,
      colorScheme: lightColorScheme,
      fontFamily: GoogleFonts.sansita().fontFamily,
      textTheme: GoogleFonts.sansitaTextTheme(),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.sansita.toString(),
        ),
      ),
    );
  }
}

// FYP Images
class FypImages {
  static const bgImage = "assets/images/bgImage.jpg";
  static const boardingImage = "assets/images/boardingImage.png";
  static const bannerImage = "assets/images/bannerImage.png";
  static const splashImage = "assets/images/splashImage.png";
}

//FYP Icons
class FypIcons{
  static const doubleArrowVertical  = "assets/icons/doubleArrowVertical.png";
  static const doubleArrowHorizontal  = "assets/icons/doubleArrowHorizontal.png";
  static const backArrow = "assets/icons/backArrow.png";
  static const findBus = "assets/icons/findBus.png";
  static const notification = "assets/icons/notification.png";
  static const busStop = "assets/icons/busStop.png";
  static const timeTable = "assets/icons/busStop.png";
}
