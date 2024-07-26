class RouteData {
  final String id;
  final String rname;
  final String startLocation;
  final String via;
  final String endLocation;
  final String duration;

  RouteData({
    required this.id,
    required this.rname,
    required this.startLocation,
    required this.via,
    required this.endLocation,
    required this.duration,
  });

  // Factory method to create a Route instance from a JSON map
  factory RouteData.fromJson(Map<String, dynamic> json) {
    return RouteData(
      id: json['id'],
      rname: json['rname'],
      startLocation: json['startlocation'],
      via: json['via'],
      endLocation: json['endlocation'],
      duration: json['duration'],
    );
  }
}

// Define the RoutesResponse model
class RoutesResponse {
  final int status;
  final List<RouteData> routes;

  RoutesResponse({
    required this.status,
    required this.routes,
  });

  // Factory method to create a RoutesResponse instance from a JSON map
  factory RoutesResponse.fromJson(Map<String, dynamic> json) {
    var routesList = json['routes'] as List;
    List<RouteData> routes = routesList.map((route) => RouteData.fromJson(route))
        .toList();

    return RoutesResponse(
      status: json['status'],
      routes: routes,
    );
  }
}
