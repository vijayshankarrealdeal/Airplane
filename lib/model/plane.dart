import 'package:flutter/cupertino.dart';

class FlightDetails {
  FlightDetails({
    required this.data,
  });
  late final List<FlightData> data;

  FlightDetails.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => FlightData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class FlightData extends ChangeNotifier {
  FlightData({
    required this.flightImage,
    required this.fightName,
    required this.flightNo,
    required this.originTime,
    required this.originPlace,
    required this.destinationTime,
    required this.destinationPlace,
    required this.durationStop,
    required this.noStops,
    required this.price,
    required this.refund,
    this.isselected = false,
  });
  late final String flightImage;
  late final String fightName;
  late final String flightNo;
  late final String originTime;
  late final String originPlace;
  late final String destinationTime;
  late final String destinationPlace;
  late final String durationStop;
  late final String noStops;
  late final String price;
  late final String refund;
  bool isselected = false;

  FlightData.fromJson(Map<String, dynamic> json) {
    flightImage = json['flight_image'];
    fightName = json['fight_name'];
    flightNo = json['flight_no'];
    originTime = json['origin_time'];
    originPlace = json['origin_place'];
    destinationTime = json['destination_time'];
    destinationPlace = json['destination_place'];
    durationStop = json['duration_stop'];
    noStops = json['no_stops'];
    price = json['price'];
    refund = json['refund'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['flight_image'] = flightImage;
    _data['fight_name'] = fightName;
    _data['flight_no'] = flightNo;
    _data['origin_time'] = originTime;
    _data['origin_place'] = originPlace;
    _data['destination_time'] = destinationTime;
    _data['destination_place'] = destinationPlace;
    _data['duration_stop'] = durationStop;
    _data['no_stops'] = noStops;
    _data['price'] = price;
    _data['refund'] = refund;
    return _data;
  }
}
