import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  Auth() {
    getToken();
  }
  String accesstoken = '';
  String refreshtoken = '';
  bool load = false;
  void getToken() async {
    final _oflineref = await SharedPreferences.getInstance();
    accesstoken = _oflineref.getString('access_token') ?? '';
    refreshtoken = _oflineref.getString('refresh_token') ?? '';
    notifyListeners();
  }

  Future<void> logout() async {
    final _oflineref = await SharedPreferences.getInstance();
    accesstoken = '';
    refreshtoken = '';
    _oflineref.setString("access_token", '');
    _oflineref.setString("refresh_token", '');
    notifyListeners();
  }

  // Future<void> newpassword(String currpassword, String newpassword) async {
  //   final _oflineref = await SharedPreferences.getInstance();

  //   final url =
  //       "https://airlinefly.azurewebsites.net/api/userforgotpass/$uid/$currpassword/$newpassword";
  //   try {
  //     load = true;
  //     notifyListeners();
  //     final _respond = await http.get(Uri.parse(url));
  //     log(_respond.body);
  //     load = false;
  //     notifyListeners();
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  Future<void> register(String email, String password) async {
    final _oflineref = await SharedPreferences.getInstance();

    const url = "https://serverxx.azurewebsites.net/api/user/register";

    try {
      final _respond = await http.post(Uri.parse(url),
          body: {'username': email, 'password': password});
      log(_respond.body);
      final _data = Map.from(json.decode(_respond.body));
      accesstoken = _data['access'];
      refreshtoken = _data['refresh'];
      _oflineref.setString("access_token", accesstoken);
      _oflineref.setString("refresh_token", refreshtoken);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> login(String email, String password) async {
    final _oflineref = await SharedPreferences.getInstance();
    const url = "https://serverxx.azurewebsites.net/api/user/login";
    try {
      final _respond = await http.post(Uri.parse(url),
          body: {'username': email, 'password': password});
      log(_respond.body);
      final _data = Map.from(json.decode(_respond.body));
      accesstoken = _data['access'];
      refreshtoken = _data['refresh'];
      _oflineref.setString("access_token", accesstoken);
      _oflineref.setString("refresh_token", refreshtoken);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
