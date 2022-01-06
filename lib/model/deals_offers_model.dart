class DealsOffer {
  DealsOffer({
    required this.data,
  });
  late final List<DealsOfferList> data;

  DealsOffer.fromJson(Map<String, dynamic> json) {
    data =
        List.from(json['data']).map((e) => DealsOfferList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class DealsOfferList {
  DealsOfferList({
    required this.id,
    required this.title,
    required this.discount,
    required this.content,
  });
  late final int id;
  late final String title;
  late final String discount;
  late final String content;

  DealsOfferList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    discount = json['discount'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['discount'] = discount;
    _data['content'] = content;
    return _data;
  }
}
