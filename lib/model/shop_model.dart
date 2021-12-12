class ShoppingModel {
  ShoppingModel({
    required this.data,
  });
  late final List<ShopData> data;

  ShoppingModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => ShopData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ShopData {
  ShopData({
    required this.contanctDetails,
    required this.content,
    required this.img,
    required this.location,
    required this.opening,
    required this.title,
  });
  late final String contanctDetails;
  late final String content;
  late final String img;
  late final String location;
  late final String opening;
  late final String title;

  ShopData.fromJson(Map<String, dynamic> json) {
    contanctDetails = json['contanct_details'];
    content = json['content'];
    img = json['img'];
    location = json['location'];
    opening = json['opening'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['contanct_details'] = contanctDetails;
    _data['content'] = content;
    _data['img'] = img;
    _data['location'] = location;
    _data['opening'] = opening;
    _data['title'] = title;
    return _data;
  }
}
