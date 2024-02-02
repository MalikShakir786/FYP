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
  static const doubleArrowIcon  = "assets/icons/doubleArrowIcon.png";
  static const backArrow = "assets/icons/backArrow.png";
}
