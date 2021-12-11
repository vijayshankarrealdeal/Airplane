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
    required this.img,
    required this.text,
  });
  late final String img;
  late final String text;

  ShopData.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['img'] = img;
    _data['text'] = text;
    return _data;
  }
}
