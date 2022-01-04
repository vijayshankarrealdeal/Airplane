import 'package:flutter/cupertino.dart';

class BusModel {
  final List<BusList> page;
  final String nya;
  BusModel({
    required this.page,
    required this.nya,
  });
}

class BusList extends ChangeNotifier {
  final String nya;
  BusList({
    required this.nya,
  });
}