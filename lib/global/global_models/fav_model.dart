import 'dart:convert';

class FavBus {
  final String busId;
  final String plateNo;
  final String busNo;
  final String driverId;
  final String availability;
  final List<String> isFavorite;
  final String driverName;
  final String driverPhone;
  final String conductorName;
  final String conductorPhone;

  FavBus({
    required this.busId,
    required this.plateNo,
    required this.busNo,
    required this.driverId,
    required this.availability,
    required this.isFavorite,
    required this.driverName,
    required this.driverPhone,
    required this.conductorName,
    required this.conductorPhone,
  });

  factory FavBus.fromJson(Map<String, dynamic> json) {
    return FavBus(
      busId: json['bus_id'],
      plateNo: json['plate_no'],
      busNo: json['bus_no'],
      driverId: json['driver_id'],
      availability: json['availability'],
      isFavorite: List<String>.from(jsonDecode(json['Is_favorite'])),
      driverName: json['driver_name'],
      driverPhone: json['driver_phone'],
      conductorName: json['conductor_name'],
      conductorPhone: json['conductor_phone'],
    );
  }
}
