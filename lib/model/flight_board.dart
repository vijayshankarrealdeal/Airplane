class AirportDashBoard {
  AirportDashBoard({
    required this.data,
  });
  late final List<FlightDashboardData> data;

  AirportDashBoard.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data'])
        .map((e) => FlightDashboardData.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class FlightDashboardData {
  FlightDashboardData({
    required this.airline,
    required this.departure,
    required this.flight,
    required this.infoUrl,
    required this.status,
    required this.time,
  });
  late final String airline;
  late final String departure;
  late final String flight;
  late final String infoUrl;
  late final String status;
  late final String time;

  FlightDashboardData.fromJson(Map<String, dynamic> json) {
    airline = json['airline'];
    departure = json['departure'];
    flight = json['flight'];
    infoUrl = json['info_url'];
    status = json['status'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['airline'] = airline;
    _data['departure'] = departure;
    _data['flight'] = flight;
    _data['info_url'] = infoUrl;
    _data['status'] = status;
    _data['time'] = time;
    return _data;
  }
}
