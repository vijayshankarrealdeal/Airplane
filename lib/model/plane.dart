import 'package:flutter/cupertino.dart';

class Flights {
  Flights({
    required this.data,
  });
  late final List<Data> data;

  Flights.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data extends ChangeNotifier {
  Data({
    required this.destCity,
    required this.destCode,
    required this.destDate,
    required this.destTime,
    required this.discountCredit,
    required this.durationOfFlight,
    required this.durationStops,
    required this.fightImg,
    required this.fightName,
    required this.flightPrice,
    required this.orginCity,
    required this.orginCode,
    required this.orginDate,
    required this.orginTime,
    this.selected = false,
  });
  late final String destCity;
  late final String destCode;
  late final String destDate;
  late final String destTime;
  late final String discountCredit;
  late final String durationOfFlight;
  late final String durationStops;
  late final String fightImg;
  late final String fightName;
  late final String flightPrice;
  late final String orginCity;
  late final String orginCode;
  late final String orginDate;
  late final String orginTime;
  bool selected = false;

  Data.fromJson(Map<String, dynamic> json) {
    destCity = json['dest_city'];
    destCode = json['dest_code'];
    destDate = json['dest_date'];
    destTime = json['dest_time'];
    discountCredit = json['discount_credit'];
    durationOfFlight = json['duration_of_flight'];
    durationStops = json['duration_stops'];
    fightImg = json['fight_img'];
    fightName = json['fight_name'];
    flightPrice = json['flight_price'];
    orginCity = json['orgin_city'];
    orginCode = json['orgin_code'];
    orginDate = json['orgin_date'];
    orginTime = json['orgin_time'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dest_city'] = destCity;
    _data['dest_code'] = destCode;
    _data['dest_date'] = destDate;
    _data['dest_time'] = destTime;
    _data['discount_credit'] = discountCredit;
    _data['duration_of_flight'] = durationOfFlight;
    _data['duration_stops'] = durationStops;
    _data['fight_img'] = fightImg;
    _data['fight_name'] = fightName;
    _data['flight_price'] = flightPrice;
    _data['orgin_city'] = orginCity;
    _data['orgin_code'] = orginCode;
    _data['orgin_date'] = orginDate;
    _data['orgin_time'] = orginTime;
    return _data;
  }
}
