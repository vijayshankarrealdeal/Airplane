import 'package:flutter/cupertino.dart';

class ServiceModel {
  final List<SubList> page;
  final String nya;
  ServiceModel({
    required this.page,
    required this.nya,
  });
}

class SubList extends ChangeNotifier {
  final String nya;
  SubList({
    required this.nya,
  });
}