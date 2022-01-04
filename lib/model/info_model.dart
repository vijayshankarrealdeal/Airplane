import 'package:flutter/cupertino.dart';

class InfoModel {
  final List<SuList> page;
  final String nya;
  InfoModel({
    required this.page,
    required this.nya,
  });
}

class SuList extends ChangeNotifier {
  final String nya;
  SuList({
    required this.nya,
  });
}