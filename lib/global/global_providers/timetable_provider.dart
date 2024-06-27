import 'package:flutter/material.dart';
import 'package:fyp/global/global_widgets/toast_message.dart';

class TimeTableProvider extends ChangeNotifier {
  List<String> busTimings = ["8:45", "1:30", "3:00", "4:30"];
  List<String> busRoute = [
    "Rawalpindi",
    "Faisalabad",
    "Multan",
    "Quetta",
    "Sialkot",
    "Bahawalpur",
    "Sukkur",
    "Sargodha",
    "Jhang",
    "Sheikhupura",
    "Gujranwala",
    "Hyderabad",
    "Mirpur Khas",
    "Nawabshah",
    "Khairpur",
    "Larkana",
    "Rahim Yar Khan",
    "Dera Ghazi Khan",
    "Sahiwal",
    "Chiniot",
    "Toba Tek Singh",
    "Okara",
    "Kasur",
    "Mianwali",
    "Muzaffargarh",
    "Vehari",
    "Abbottabad",
    "Attock",
    "Chakwal",
    "Khanewal"
  ];


  List<String> routesList = [];

  var timingController = TextEditingController();
  var routeController = TextEditingController();

  void addRoute(String route,BuildContext context) {
    if (route.isNotEmpty) {
      if (!routesList.contains(route)) {
        routesList.add(route);
        notifyListeners();
      } else {
        showToast("Already added!").show(context);
      }
    }
  }

  void removeRoute(String route) {
    if (routesList.contains(route)) {
      routesList.remove(route);
      notifyListeners();
    }
  }

}
