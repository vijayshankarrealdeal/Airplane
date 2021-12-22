import 'package:flutter/cupertino.dart';

class CheckModel extends ChangeNotifier{
  final List<String> page;
  final String nya;
  bool select = false;
  CheckModel({
    required this.page,
    required this.nya,
    this.select = false,
  });
  void isselect(){
    select =! select;
    notifyListeners();
  }
}