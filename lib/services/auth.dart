import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  Auth() {
    getToken();
  }
  String token = '';
  String uid = '';

  Future<void> getToken() async {
    final _oflineref = await SharedPreferences.getInstance();
    token = _oflineref.getString('token') ?? '';
    uid = _oflineref.getString('uid') ?? '';
    final url =
        'https://airlinefly.azurewebsites.net/api/refresh_token/$token/$uid';
    final _respond = await http.get(Uri.parse(url));
    if (_respond.statusCode == 200) {
      final _data = Map.from(json.decode(_respond.body));
      if (_data['token'] != 'error') {
        token = _data['token'];
        uid = _data['uid'];
        notifyListeners();
      }
      return;
    }
    notifyListeners();
  }

  Future<void> register(String email, String password) async {
    final _oflineref = await SharedPreferences.getInstance();
    final url =
        "https://airlinefly.azurewebsites.net/api/userreg/$email/$password";
    try {
      final _respond = await http.get(Uri.parse(url));
      final _data = Map.from(json.decode(_respond.body));
      print(_data);
      token = _data['token'];
      uid = _data['uid'];
      _oflineref.setString("token", token);
      _oflineref.setString("uid", uid);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> login(String email, String password) async {
    final _oflineref = await SharedPreferences.getInstance();
    final url =
        "https://airlinefly.azurewebsites.net/api/login/$email/$password";
    try {
      final _respond = await http.get(Uri.parse(url));
      final _data = Map.from(json.decode(_respond.body));
      token = _data['token'];
      uid = _data['uid'];
      _oflineref.setString("token", token);
      _oflineref.setString("uid", uid);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
