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
  static const bannerImage8 = "assets/images/bannerImage8.png";
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
  static const getHelp = "assets/icons/getHelp.png";
  static const support = "assets/icons/support.png";
  static const darkMode = "assets/icons/darkMode.png";
  static const chevronLeft = "assets/icons/chevronLeft.png";
  static const edit = "assets/icons/edit.png";
  static const aboutApp = "assets/icons/aboutApp.png";
}

class Constants {
  static const baseUrl = "a312-119-73-113-12.ngrok-free.app";
}

class EndPoints {
  //Auth
  static const signup = "/php-api/user/create.php";
  static const login = "/php-api/user/login.php";
  static const forget = "/php-api/user/forgetpassword.php";
  static const updatePassword = "/php-api/user/updatepassword.php";
  static const changePassword = "/php-api/user/changepassword.php";

  //User
  static const getUser = "/php-api/user/read.php";
  static const updateUser = "/php-api/user/update.php";
  static const searchUser = "/php-api/user/search.php";
  static const deleteUser = "/php-api/user/delete.php";

  //Recent Searches
  static const searches = "/php-api/search/search.php";

  //Feedback
  static const insertFeedback = "/php-api/feedback/insert.php";
  static const deleteFeedback = "/php-api/feedback/deletefeedback.php";
  static const searchFeedback = "/php-api/feedback/searchfeedback.php";
  static const showFeedback = "/php-api/feedback/show_feedback.php";

  //Timetable
  static const searchTimetable = "/php-api/timetable/search.php";
  static const insertTimetable = "/php-api/timetable/insert.php";
  static const deleteTimetable = "/php-api/timetable/delete.php";
  static const showTimetable = "/php-api/timetable/show.php";
  static const updateTimetable = "/php-api/timetable/update.php";

  //Buses
  static const getBuses = "/php-api/bus/show.php";
  static const updateBuses = "/php-api/bus/update.php";
  static const deleteBus = "/php-api/bus/delete.php";
  static const insertBus = "/php-api/bus/insert.php";

  //Records
  static const getRecords = "/php-api/records/get.php";

  //Routes
  static const getRoutes = "/php-api/route/show.php";
  static const insertRoutes = "/php-api/route/insert.php";
  static const deleteRoutes = "/php-api/route/delete.php";
  static const updateRoutes = "/php-api/route/update.php";

  //Notifications
  static const getNotifications = "/php-api/notification/show.php";
  static const deleteNotifications = "/php-api/notification/delete.php";
  static const searchNotifications = "/php-api/notification/search.php";

  // Favorite
  static const favorite = "/php-api/favorite/favorite.php";


}
