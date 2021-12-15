import 'dart:convert';
import 'package:airplane/model/flight_board.dart';
import 'package:airplane/model/hotel_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class AccountControllers extends ChangeNotifier {
  AccountControllers() {
    call();
  }
  List<FlightDashboardData> _dashBoard = [];
  List<FlightDashboardData> get flightdetails => _dashBoard;
  List<HotelData> _hotel_list = [];
  List<HotelData> get hoteldetails => _hotel_list;
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

  void hotelcall(int checkinday, int checkoutday, int checkinmonth,
      int checkoutmonth, int checkinyr, int checkoutyr) async {
    String host = "10.0.2.2:5000";
    try {
      final _response = await http.get(Uri.parse(
          'http://$host/gethotel/$checkinday/$checkinmonth/$checkinyr/$checkoutday/$checkoutmonth/$checkoutyr'));
      Map<String, dynamic> _daa = json.decode(_response.body);
      Hotels _data = Hotels.fromJson(_daa);
      _hotel_list = _data.data;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  //
}
