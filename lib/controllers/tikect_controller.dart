import 'dart:convert';
import 'package:airplane/model/mytrips_tickets.dart';
import 'package:airplane/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class TicketsAndMore extends ChangeNotifier {
  TicketsAndMore(BuildContext context) {
    functionRin(context);
  }
  List<FlightDataT> data = [];
  void removeitem(FlightDataT value, Auth auth) async {
    data.remove(value);
    notifyListeners();
    // /api/mytrips/
    final _response = await http.get(
        Uri.parse(
            'https://serverxx.azurewebsites.net/api/delete_ticket/${value.id}'),
        headers: {"Authorization": 'Bearer ${auth.accesstoken}'});
    notifyListeners();

    if (_response.statusCode != 200) {
      data.add(value);
    }
  }

  bool load = false;
  int coins = 0;
  String error = '';

  Future<void> cancelTicket(Auth auth, int id, int index) async {
    load = true;
    notifyListeners();
    final _response = await http.get(
        Uri.parse('https://serverxx.azurewebsites.net/api/cancel_ticket/$id'),
        headers: {"Authorization": 'Bearer ${auth.accesstoken}'});
    await deleteBLR(auth);
    final _daa = json.decode(_response.body);
    if (_daa['data'] == "Success") {
      data[index].cancel = true;
      load = false;
      notifyListeners();
    }
  }

  Future<void> updateBLR(Auth auth) async {
    await http.get(
        Uri.parse('https://serverxx.azurewebsites.net/api/update_coins/'),
        headers: {"Authorization": 'Bearer ${auth.accesstoken}'});
  }

  Future<void> deleteBLR(Auth auth) async {
    await http.get(
        Uri.parse('https://serverxx.azurewebsites.net/api/delete_coins/'),
        headers: {"Authorization": 'Bearer ${auth.accesstoken}'});
  }

  void functionRin(BuildContext context) async {
    final auth = Provider.of<Auth>(context, listen: false);
//
    try {
      final _response = await http.get(
          Uri.parse('https://serverxx.azurewebsites.net/api/mytrips/'),
          headers: {"Authorization": 'Bearer ${auth.accesstoken}'});
      final _daa = json.decode(_response.body);
      TicketBooks _books = TicketBooks.fromJson(_daa);
      data = _books.data..sort((a, b) => b.id.compareTo(a.id));
      coins = _books.data.length * 50;
      load = true;
      notifyListeners();
    } catch (e) {
      load = false;
      error = 'yes';
      notifyListeners();
    }
  }
}
