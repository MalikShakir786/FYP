import 'package:flutter/material.dart';

class BusProvider extends ChangeNotifier{
  List<String> busNumbers = List.generate(20, (index) => (index+1).toString());
  List<String> busTypes = ["Combine","Boys","Girls"];
  List<String> busNoPlates = ["GRT_6878","GTK-8762","GON-4983"];
  List<String> busTimings = ["8:45","1:30","3:00","4:30"];
  List<String> busRoute = ["Gujrat","Karachi","Lahore","Abbotabad","Islamabad","Peshawar","Mardan"];
  List<String> driverNames = ["Noman","Ali","Ilyas","Faraz"];
  List<String> driverContacts = ["0305-2937498","0324-3929873","0312-8268723"];

  var noController = TextEditingController();
  var noPlateController = TextEditingController();
  var timeController = TextEditingController();
  var typeController = TextEditingController();
  var routeController = TextEditingController();
  var dNameController = TextEditingController();
  var dContactController = TextEditingController();
  var cNameController = TextEditingController();
  var cContactController = TextEditingController();
}