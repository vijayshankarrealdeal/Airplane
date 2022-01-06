import 'dart:convert';
import 'package:airplane/model/flight_board.dart';
import 'package:airplane/model/hotel_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class AccountControllers extends ChangeNotifier {
  AccountControllers() {
    call();
  }

  TextEditingController controller = TextEditingController();
  List<FlightDashboardData> _dashBoard = [];
  List<FlightDashboardData> get flightdetails => _dashBoard;
  List<FlightDashboardData> searchyourf = [];
  List<HotelData> _hotellist = [];
  List<HotelData> get hoteldetails => _hotellist;

  DateTime startdate = DateTime.now();
  String pickedDate = 'Check In date';
  DateTime enddate = DateTime.now();
  String endate = 'Check out date';

  bool load = true;
  void call() async {
    String host = "https://serverxx.azurewebsites.net/api/flightstauts/";
    try {
      final _response = await http.get(Uri.parse(host));
      Map<String, dynamic> _daa = json.decode(_response.body);
      AirportDashBoard _data = AirportDashBoard.fromJson(_daa);
      _dashBoard = _data.data..sort((a, b) => a.time.compareTo(b.time));
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  void getSearch(String s) {
    searchyourf.clear();
    searchyourf = flightdetails
        .where((element) =>
            element.airline.toLowerCase().contains(s.toLowerCase()) ||
            element.flight.toLowerCase().contains(s.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void sortbydistance() {
    _hotellist.sort((a, b) => b.distance.compareTo(a.distance));
    notifyListeners();
  }

  void sortbylowdistance() {
    _hotellist.sort((a, b) => a.distance.compareTo(b.distance));
    notifyListeners();
  }

  void sortbylowtohighamount() {
    _hotellist.sort((a, b) => b.price.compareTo(a.price));
    notifyListeners();
  }

  void sortbyhightolowamount() {
    _hotellist.sort((a, b) => a.price.compareTo(b.price));
    notifyListeners();
  }

  void hotelcall(String checkin, String checkout) async {
   
    _hotellist.clear();
    try {
      load = false;
      notifyListeners();

      final _response = await http.post(
        Uri.parse(
            'https://serverxxfun.azurewebsites.net/api/HttpTrigger?code=qh1AR0D0VV84OrVQPLaoe68O3SaRyJTtD/Jlti6TLUf9z2FSa7oHrw=='),
        body: json.encode(
          {
            "hotel": true,
            "checkin": checkin.toString(),
            "checkout": checkout.toString()
          },
        ),
      );
      Map<String, dynamic> _daa = json.decode(_response.body);
      Hotels _data = Hotels.fromJson(_daa);
      _hotellist = _data.data;
      load = true;
      notifyListeners();
    } catch (e) {
      load = true;
      notifyListeners();
  
    }
  }

  Future<void> incomedate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startdate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != startdate) {
      startdate = picked;
      pickedDate = startdate.toLocal().toString().split(' ')[0];
      notifyListeners();
    }
  }

  Future<void> outdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: enddate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != enddate) {
      enddate = picked;
      endate = enddate.toLocal().toString().split(' ')[0];
      notifyListeners();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  //
}
