import 'dart:convert';

class BusNotification {
  final String busNo;
  final String id;
  final String message;
  final String isRead;
  final String createdAt;
  final String plateNo;
  final String busBusNo;
  final String driverId;
  final String driverName;
  final String driverPhoneNo;
  final String availability;
  final List<String> isFavorite;
  final String conId;
  final String conductorName;
  final String conductorPhoneNo;

  BusNotification({
    required this.busNo,
    required this.id,
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

  factory BusNotification.fromJson(Map<String, dynamic> json) {
    return BusNotification(
      busNo: json['bus_no'] ?? '',
      id: json['id'] ?? '',
      message: json['message'] ?? '',
      isRead: json['is_read'] ?? '',
      createdAt: json['created_at'] ?? '',
      plateNo: json['plate_no'] ?? '',
      busBusNo: json['bus_bus_no'] ?? '',
      driverId: json['driver_id'] ?? '',
      driverName: json['driver_name'] ?? '',
      driverPhoneNo: json['driver_phone_no'] ?? '',
      availability: json['availability'] ?? '',
      isFavorite: json['Is_favorite'] != null ? List<String>.from(jsonDecode(json['Is_favorite'])) : [],
      conId: json['con_id'] ?? '',
      conductorName: json['conductor_name'] ?? '',
      conductorPhoneNo: json['conductor_phone_no'] ?? '',
    );
  }
}

class BusNotificationResponse {
  final String status;
  final String message;
  final List<BusNotification> data;

  BusNotificationResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BusNotificationResponse.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<BusNotification> busNotifications = dataList.map((i) => BusNotification.fromJson(i)).toList();

    return BusNotificationResponse(
      status: json['status'],
      message: json['message'],
      data: busNotifications,
    );
  }
}
