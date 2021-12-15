class Hotels {
  Hotels({
    required this.data,
  });
  late final List<HotelData> data;

  Hotels.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => HotelData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class HotelData {
  HotelData({
    required this.distance,
    required this.distanceM,
    required this.hotelName,
    required this.mediaImg,
    required this.money,
    required this.moneyNum,
    required this.moreDetailLink,
    required this.rating,
    required this.tax,
  });
  late final String distance;
  late final int distanceM;
  late final String hotelName;
  late final String mediaImg;
  late final String money;
  late final int moneyNum;
  late final String moreDetailLink;
  late final String rating;
  late final String tax;

  HotelData.fromJson(Map<String, dynamic> json) {
    distance = json['distance'];
    distanceM = json['distanceM'];
    hotelName = json['hotel_name'];
    mediaImg = json['media_img'];
    money = json['money'];
    moneyNum = json['money_num'];
    moreDetailLink = json['more_detail_link'];
    rating = json['rating'];
    tax = json['tax'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['distance'] = distance;
    _data['distanceM'] = distanceM;
    _data['hotel_name'] = hotelName;
    _data['media_img'] = mediaImg;
    _data['money'] = money;
    _data['money_num'] = moneyNum;
    _data['more_detail_link'] = moreDetailLink;
    _data['rating'] = rating;
    _data['tax'] = tax;
    return _data;
  }
}
