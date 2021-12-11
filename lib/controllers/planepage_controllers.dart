import 'dart:convert';
import 'package:airplane/model/plane.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PlaneControllers extends ChangeNotifier {
  bool load = true;

  List<Data> _flightMainData = [];
  List<Data> get flight => _flightMainData;
  DateTime selectedDate = DateTime.now();
  String pickedDate = 'Select Date';
  String error = '';

  final Map<String, String> _codeX = {
    "bengaluru": "BLR",
    "kolkata": "CCU",
    "new delhi": "DEL",
    "mumbai": "BOM",
    "chennai": "MAA",
  };

  final List<String> _listPlaces = [
    "Bengaluru",
    "Kolkata",
    "New Delhi",
    "Mumbai",
    "Chennai",
  ];
  Future<Iterable<String>> returnSuggestion(String suggestion) async {
    var x = _listPlaces.where(
        (element) => element.toLowerCase().contains(suggestion.toLowerCase()));
    return Future.value(x);
  }

  TextEditingController originfrom = TextEditingController();
  TextEditingController destto = TextEditingController();
  void onsuggestionselect(String suggestion) {
    originfrom.text = suggestion;
    notifyListeners();
  }

  void onsuggestionselect2(String suggestion) {
    destto.text = suggestion;
    notifyListeners();
  }

  List<Data> watchLish = [];
  void addToWatchList(Data data) {
    int index = _flightMainData.indexOf(data);
    flight[index].selected = true;
    watchLish.add(data);
    notifyListeners();
  }

  void removeWatchList(Data data) {
    int index = _flightMainData.indexOf(data);
    flight[index].selected = false;
    watchLish.remove(data);
    notifyListeners();
  }

  bool searchdone = true;

  void call(String from, String where, String date, int adult, int children,
      int infant) async {
    from = _codeX[from].toString();
    where = _codeX[where].toString();
    try {
      searchdone = false;
      load = false;
      notifyListeners();
      final _response = await http.get(Uri.parse(
          'http://10.0.2.2:5000/getflights/$from/$where/$date/$adult/$children/$infant'));
      Map<String, dynamic> _daa = json.decode(_response.body);
      List<dynamic> data = _daa['data'] ?? [];
      _flightMainData = data.map((e) => Data.fromJson(e)).toList();

      load = true;
      searchdone = true;
      notifyListeners();
    } catch (e) {
      searchdone = true;
      error = e.toString();
      load = true;
      notifyListeners();
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      pickedDate = selectedDate.toLocal().toString().split(' ')[0];
      notifyListeners();
    }
  }

  @override
  void dispose() {
    originfrom.dispose();
    destto.dispose();
    super.dispose();
  }
}
