import 'package:flutter/cupertino.dart';

class CheckModel {
  final List<SubList> page;
  final String nya;
  CheckModel({
    required this.page,
    required this.nya,
  });
}

class SubList extends ChangeNotifier {
  final String nya;
  bool select = false;
  SubList({
    required this.nya,
    this.select = false,
  });
  void isselect() {
    select = !select;
    notifyListeners();
  }
}
