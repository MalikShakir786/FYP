import 'dart:convert';

class BusInfo {
  final String id;
  final String busNo;
  final String message;
  final String isRead;
  final String createdAt;
  final String plateNo;
  final String busBusNo;
  final String driverId;
  final String driverName;
  final String driverPhoneNo;
  final String availability;
  final List<String> isFavorite; // Changed to List<String>
  final String conId;
  final String conductorName;
  final String conductorPhoneNo;

  BusInfo({
    required this.id,
    required this.busNo,
    required this.message,
    required this.isRead,
    required this.createdAt,
    required this.plateNo,
    required this.busBusNo,
    required this.driverId,
    required this.driverName,
    required this.driverPhoneNo,
    required this.availability,
    required this.isFavorite,
    required this.conId,
    required this.conductorName,
    required this.conductorPhoneNo,
  });

  factory BusInfo.fromJson(Map<String, dynamic> json) {
    return BusInfo(
      id: json['id'],
      busNo: json['bus_no'],
      message: json['message'],
      isRead: json['is_read'],
      createdAt: json['created_at'],
      plateNo: json['plate_no'],
      busBusNo: json['bus_bus_no'],
      driverId: json['driver_id'],
      driverName: json['driver_name'],
      driverPhoneNo: json['driver_phone_no'],
      availability: json['availability'],
      isFavorite: List<String>.from(jsonDecode(json['Is_favorite'])),
      conId: json['con_id'],
      conductorName: json['conductor_name'],
      conductorPhoneNo: json['conductor_phone_no'],
    );
  }
}

class ResponseData {
  final List<BusInfo> data;

  ResponseData({required this.data});

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      data: List<BusInfo>.from(json['data'].map((x) => BusInfo.fromJson(x))),
    );
  }
}
