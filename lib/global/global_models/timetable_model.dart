class TimetableResponse {
  final int status;
  final List<Timetable> timetables;

  TimetableResponse({
    required this.status,
    required this.timetables,
  });

  factory TimetableResponse.fromJson(Map<String, dynamic> json) {
    return TimetableResponse(
      status: json['status'],
      timetables: (json['timetables'] as List<dynamic>)
          .map((timetable) => Timetable.fromJson(timetable))
          .toList(),
    );
  }
}

class Timetable {
  final int id;
  final int busId;
  final String status;
  final String startTime;
  final String departureTime;
  final int routeId;
  final String plateNo;
  final int busNo;
  final String routeName;
  final String startLocation;
  final String via;
  final String driverName;
  final String driverPhoneNo;
  final String conductorName;
  final String conductorPhoneNo;

  Timetable({
    required this.id,
    required this.busId,
    required this.status,
    required this.startTime,
    required this.departureTime,
    required this.routeId,
    required this.plateNo,
    required this.busNo,
    required this.routeName,
    required this.startLocation,
    required this.via,
    required this.driverName,
    required this.driverPhoneNo,
    required this.conductorName,
    required this.conductorPhoneNo,
  });

  factory Timetable.fromJson(Map<String, dynamic> json) {
    return Timetable(
      id: json['id'],
      busId: json['bus_id'],
      status: json['status'],
      startTime: json['s_time'],
      departureTime: json['departure_time'],
      routeId: json['route_id'],
      plateNo: json['plate_no'],
      busNo: json['bus_no'],
      routeName: json['rname'],
      startLocation: json['startlocation'],
      via: json['via'],
      driverName: json['driver_name'],
      driverPhoneNo: json['driver_phone_no'],
      conductorName: json['conductor_name'],
      conductorPhoneNo: json['conductor_phone_no'],
    );
  }
}
