class CheckMain {
  CheckMain({
    required this.data,
  });
  late final List<ChecklistList> data;

  CheckMain.fromJson(Map<String, dynamic> json) {
    data =
        List.from(json['data']).map((e) => ChecklistList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ChecklistList {
  ChecklistList({
    required this.id,
    required this.documents,
    required this.financial,
    required this.clothes,
    required this.travelaids,
    required this.appliances,
    required this.health,
    required this.toiletries,
    required this.genralActivity,
  });
  late final int id;
  late final List<String> documents;
  late final List<dynamic> financial;
  late final List<String> clothes;
  late final List<dynamic> travelaids;
  late final List<String> appliances;
  late final List<dynamic> health;
  late final List<dynamic> toiletries;
  late final List<dynamic> genralActivity;

  ChecklistList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    documents = List.castFrom<dynamic, String>(json['Documents']);
    financial = List.castFrom<dynamic, dynamic>(json['Financial']);
    clothes = List.castFrom<dynamic, String>(json['Clothes']);
    travelaids = List.castFrom<dynamic, String>(json['Travelaids']);
    appliances = List.castFrom<dynamic, String>(json['Appliances']);
    health = List.castFrom<dynamic, String>(json['Health']);
    toiletries = List.castFrom<dynamic, String>(json['Toiletries']);
    genralActivity = List.castFrom<dynamic, String>(json['genral_activity']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['Documents'] = documents;
    _data['Financial'] = financial;
    _data['Clothes'] = clothes;
    _data['Travelaids'] = travelaids;
    _data['Appliances'] = appliances;
    _data['Health'] = health;
    _data['Toiletries'] = toiletries;
    _data['genral_activity'] = genralActivity;
    return _data;
  }
}





// class CheckModel {
//   final List<SubList> page;
//   final String nya;
//   CheckModel({
//     required this.page,
//     required this.nya,
//   });
// }

// class SubList extends ChangeNotifier {
//   final String nya;
//   bool select = false;
//   SubList({
//     required this.nya,
//     this.select = false,
//   });
//   void isselect() {
//     select = !select;
//     notifyListeners();
//   }
// }
