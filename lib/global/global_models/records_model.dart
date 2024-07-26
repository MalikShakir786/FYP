class BusRecord {
  final String id;
  final String plateNo;
  final String busNo;
  final String status;
  final String routeName;
  final String sTime;
  final String departureTime;
  final String driverName;
  final String driverPhoneNo;
  final String conductorName;
  final String conductorPhoneNo;
  final String dateTime;

  BusRecord({
    required this.id,
    required this.plateNo,
    required this.busNo,
    required this.status,
    required this.routeName,
    required this.sTime,
    required this.departureTime,
    required this.driverName,
    required this.driverPhoneNo,
    required this.conductorName,
    required this.conductorPhoneNo,
    required this.dateTime,
  });

  factory BusRecord.fromJson(Map<String, dynamic> json) {
    return BusRecord(
      id: json['id'],
      plateNo: json['plate_no'],
      busNo: json['bus_no'],
      status: json['status'],
      routeName: json['route_name'],
      sTime: json['s_time'],
      departureTime: json['departure_time'],
      driverName: json['driver_name'],
      driverPhoneNo: json['driver_phone_no'],
      conductorName: json['conductor_name'],
      conductorPhoneNo: json['conductor_phone_no'],
      dateTime: json['date_time'],
    );
  }
}

class BusRecordsResponse {
  final int status;
  final String message;
  final List<BusRecord> data;

  BusRecordsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BusRecordsResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<BusRecord> busRecordsList = list.map((i) => BusRecord.fromJson(i)).toList();

    return BusRecordsResponse(
      status: json['status'],
      message: json['message'],
      data: busRecordsList,
    );
  }
}
