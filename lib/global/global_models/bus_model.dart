class BusData {
  final int status;
  final String message;
  final List<Bus> data;

  BusData({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BusData.fromJson(Map<String, dynamic> json) {
    List<Bus> buses = [];
    if (json['data'] != null) {
      json['data'].forEach((busJson) {
        buses.add(Bus.fromJson(busJson));
      });
    }
    return BusData(
      status: json['status'],
      message: json['message'],
      data: buses,
    );
  }
}

class Bus {
  final String busId;
  final String plateNo;
  final String busNo;
  final Driver driver;
  final Conductor conductor;

  Bus({
    required this.busId,
    required this.plateNo,
    required this.busNo,
    required this.driver,
    required this.conductor,
  });

  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
      busId: json['bus_id'],
      plateNo: json['plate_no'],
      busNo: json['bus_no'],
      driver: Driver.fromJson(json['driver']),
      conductor: Conductor.fromJson(json['conductor']),
    );
  }
}

class Driver {
  final String driverId;
  final String driverName;
  final String driverPhone;

  Driver({
    required this.driverId,
    required this.driverName,
    required this.driverPhone,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      driverId: json['driver_id'],
      driverName: json['driver_name'],
      driverPhone: json['driver_phone'],
    );
  }
}

class Conductor {
  final String conductorId;
  final String conductorName;
  final String conductorPhone;

  Conductor({
    required this.conductorId,
    required this.conductorName,
    required this.conductorPhone,
  });

  factory Conductor.fromJson(Map<String, dynamic> json) {
    return Conductor(
      conductorId: json['conductor_id'],
      conductorName: json['conductor_name'],
      conductorPhone: json['conductor_phone'],
    );
  }
}
