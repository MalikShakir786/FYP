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
  static const bannerImage1 = "assets/images/bannerImage1.png";
  static const bannerImage2 = "assets/images/bannerImage2.jpg";
  static const bannerImage3 = "assets/images/bannerImage3.jpg";
  static const bannerImage4 = "assets/images/bannerImage4.jpg";
  static const bannerImage5 = "assets/images/bannerImage5.jpg";
  static const splashImage = "assets/images/splashImage.png";
  static const userAvatar = "assets/images/userAvatar.png";
  static const deskBgImage1 = "assets/images/deskBgImage1.jpg";
  static const logoDesktop = "assets/images/logoDesktop.png";
}

//FYP Icons
class FypIcons{
  static const doubleArrowVertical  = "assets/icons/doubleArrowVertical.png";
  static const doubleArrowHorizontal  = "assets/icons/doubleArrowHorizontal.png";
  static const backArrow = "assets/icons/backArrow.png";
  static const findBus = "assets/icons/findBus.png";
  static const notification = "assets/icons/notification.png";
  static const busStop = "assets/icons/busStop.png";
  static const timeTable = "assets/icons/timeTable.png";
  static const infoIcon = "assets/icons/infoIcon.png";
  static const busList = "assets/icons/busList.png";
  static const favBus = "assets/icons/favBus.png";
  static const bus = "assets/icons/bus.png";
  static const feedback = "assets/icons/feedBack.png";
  static const users = "assets/icons/users.png";
  static const dashBoard = "assets/icons/dashBoard.png";
  static const menu = "assets/icons/menu.png";
  static const cross = "assets/icons/cross.png";
}
