import 'dart:convert';
import 'dart:developer';

import 'package:airplane/model/mytrips_tickets.dart';
import 'package:airplane/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class TicketsAndMore extends ChangeNotifier {
  TicketsAndMore(BuildContext context) {
    functionRin(context);
  }
  List<DataXTT> data = [];

  void remove(DataXTT value) {
    data.remove(value);
    notifyListeners();
  }

  bool load = false;
  int coins = 0;
  String error = '';
  void functionRin(BuildContext context) async {
    final auth = Provider.of<Auth>(context, listen: false);
    try {
      log('iran');
      final _response = await http.get(
          Uri.parse('https://serverxx.azurewebsites.net/api/mytrips/'),
          headers: {"Authorization": 'Bearer ${auth.accesstoken}'});
      final _daa = json.decode(_response.body);
      TicketsBooks _books = TicketsBooks.fromJson(_daa);
      data = _books.data;
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
