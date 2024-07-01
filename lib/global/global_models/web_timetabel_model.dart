class WebTimetableResponse {
  String status;
  List<WebTimetable> timetables;

  WebTimetableResponse({
    required this.status,
    required this.timetables,
  });

  factory WebTimetableResponse.fromJson(Map<String, dynamic> json) {
    return WebTimetableResponse(
      status: json['status'],
      timetables: (json['timetables'] as List<dynamic>)
          .map((timetable) => WebTimetable.fromJson(timetable))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'timetables': timetables.map((timetable) => timetable.toJson()).toList(),
    };
  }
}


class WebTimetable {
  String id;
  String plateNo;
  String busNo;
  String status;
  String sTime;
  String departureTime;
  String rname;
  String startLocation;
  String via;
  String driverName;
  String driverPhoneNo;
  String conductorName;
  String conductorPhoneNo;

  WebTimetable({
    required this.id,
    required this.plateNo,
    required this.busNo,
    required this.status,
    required this.sTime,
    required this.departureTime,
    required this.rname,
    required this.startLocation,
    required this.via,
    required this.driverName,
    required this.driverPhoneNo,
    required this.conductorName,
    required this.conductorPhoneNo,
  });

  factory WebTimetable.fromJson(Map<String, dynamic> json) {
    return WebTimetable(
      id: json['id'],
      plateNo: json['plate_no'],
      busNo: json['bus_no'],
      status: json['status'],
      sTime: json['s_time'],
      departureTime: json['departure_time'],
      rname: json['rname'],
      startLocation: json['startlocation'],
      via: json['via'],
      driverName: json['driver_name'],
      driverPhoneNo: json['driver_phone_no'],
      conductorName: json['conductor_name'],
      conductorPhoneNo: json['conductor_phone_no'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'plate_no': plateNo,
      'bus_no': busNo,
      'status': status,
      's_time': sTime,
      'departure_time': departureTime,
      'rname': rname,
      'startlocation': startLocation,
      'via': via,
      'driver_name': driverName,
      'driver_phone_no': driverPhoneNo,
      'conductor_name': conductorName,
      'conductor_phone_no': conductorPhoneNo,
    };
  }
}

