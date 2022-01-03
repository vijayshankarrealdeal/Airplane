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
    required this.img,
    required this.hotelName,
    required this.rating,
    required this.distance,
    required this.price,
    required this.tax,
  });
  late final String img;
  late final String hotelName;
  late final String rating;
  late final String distance;
  late final String price;
  late final String tax;

  HotelData.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    hotelName = json['hotel_name'];
    rating = json['rating'];
    distance = json['distance'];
    price = json['price'];
    tax = json['tax'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['img'] = img;
    _data['hotel_name'] = hotelName;
    _data['rating'] = rating;
    _data['distance'] = distance;
    _data['price'] = price;
    _data['tax'] = tax;
    return _data;
  }
}
