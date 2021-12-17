import 'dart:convert';
import 'package:airplane/model/flight_board.dart';
import 'package:airplane/model/hotel_model.dart';
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

  bool load = true;
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

  void getSearch(String s) {
    searchyourf.clear();
    searchyourf = flightdetails
        .where((element) =>
            element.airline.toLowerCase().contains(s.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void hotelcall(int checkinday, int checkoutday, int checkinmonth,
      int checkoutmonth, int checkinyr, int checkoutyr) async {
    String host = "10.0.2.2:5000";
    _hotellist.clear();
    try {
      load = false;
      notifyListeners();
      final _response = await http
          .get(Uri.parse('http://$host/gethotel/15/12/2021/22/12/2021'));
      //  "gethotel/$checkinday/$checkinmonth/$checkinyr/$checkoutday/$checkoutmonth/$checkoutyr"
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  //
}
