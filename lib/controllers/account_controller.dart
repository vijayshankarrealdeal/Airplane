import 'dart:convert';
import 'package:airplane/model/flight_board.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class AccountControllers extends ChangeNotifier {
  AccountControllers() {
    call();
  }
  List<FlightDashboardData> _dashBoard = [];
  List<FlightDashboardData> get flightdetails => _dashBoard;
  void call() async {
    String host = "10.0.2.2:5000";
    try {
      final _response =
          await http.get(Uri.parse('http://$host/getflightstatus/'));
      Map<String, dynamic> _daa = json.decode(_response.body);
      AirportDashBoard _data = AirportDashBoard.fromJson(_daa);
      _dashBoard = _data.data;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }
}
