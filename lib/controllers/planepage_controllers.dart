import 'dart:convert';
import 'dart:developer';
import 'package:airplane/model/plane.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlaneControllers extends ChangeNotifier {
  bool load = true;

  List<FlightData> _flightMainData = [];
  List<FlightData> get flight => _flightMainData;
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

  void changethelines() {
    String tmp = originfrom.text;
    originfrom.text = destto.text;
    destto.text = tmp;
    notifyListeners();
  }

  void onsuggestionselect(String suggestion) {
    originfrom.text = suggestion;
    notifyListeners();
  }

  void onsuggestionselect2(String suggestion) {
    destto.text = suggestion;
    notifyListeners();
  }

  List<FlightData> watchLish = [];
  void addToWatchList(FlightData data) {
    int index = _flightMainData.indexOf(data);
    flight[index].isselected = true;
    watchLish.add(data);
    notifyListeners();
  }

  void removeWatchList(FlightData data) {
    int index = _flightMainData.indexOf(data);
    flight[index].isselected = false;
    watchLish.remove(data);
    notifyListeners();
  }

  bool searchdone = true;

  void call(String from, String where, String date, int adult, int children,
      int infant) async {
    searchdone = false;
    load = false;
    notifyListeners();

    // try {
    final _response = await http.post(
        Uri.parse(
            'https://serverxxfun.azurewebsites.net/api/HttpTrigger?code=qh1AR0D0VV84OrVQPLaoe68O3SaRyJTtD/Jlti6TLUf9z2FSa7oHrw=='),
        body: json.encode(
          {
            "hotel": false,
            "origin_code": _codeX[from].toString(),
            "orginName": from,
            "destination_code": _codeX[where].toString(),
            "destinaitionName": where,
            "departure_date": date,
            "adult": 1,
            "child": 0,
            "infant": 0
          },
        ));
    log(_response.statusCode.toString());
    log(_response.body);

    Map<String, dynamic> _daa = json.decode(_response.body);
    List<dynamic> data = _daa['data'] ?? [];
    _flightMainData = data.map((e) => FlightData.fromJson(e)).toList();

    load = true;
    searchdone = true;
    notifyListeners();

    // } catch (e) {
    //   log(e.toString());
    //   searchdone = true;
    //   error = "Some error";
    //   load = true;
    //   notifyListeners();
    // }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
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
