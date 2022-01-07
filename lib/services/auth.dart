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
  String email = '';
  Map<String, dynamic> data = {};
  bool load = false;
  Future<void> getToken() async {
    final _oflineref = await SharedPreferences.getInstance();
    accesstoken = _oflineref.getString('access_token') ?? '';
    email = _oflineref.getString('username') ?? '';
    data['email'] = email;
    getBlrCoins();
    notifyListeners();
  }

  Future<void> getBlrCoins() async {
    if (accesstoken.isNotEmpty) {
      try {
        final _resp = await http.get(
            Uri.parse('https://serverxx.azurewebsites.net/api/get_coins/'),
            headers: {
              "Content-Type": "application/json; charset=UTF-8",
              "Authorization": 'Bearer $accesstoken'
            });
        data['blrCoins'] = json.decode(_resp.body)[0]['coins'];
        notifyListeners();
      } catch (e) {
        log(e.toString());
      }
    }
  }

  Future<bool> logout() async {
    try {
      final _oflineref = await SharedPreferences.getInstance();
      accesstoken = '';
      email = '';
      data = {};
      _oflineref.setString("access_token", '');
      _oflineref.setString('username', '');
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> register(
      String email, String password, BuildContext context) async {
    final _oflineref = await SharedPreferences.getInstance();
    try {
      final _respond = await http.post(
          Uri.parse("https://serverxx.azurewebsites.net/api/user/register"),
          body: {'email': email, 'password': password});
      final _data = Map.from(json.decode(_respond.body));

      log(_respond.body);
      if (_data['detail'] == "User with this exits'email'") {
        throw "User with email exits";
      }

      _data.forEach((key, value) {
        data[key] = value;
      });
      getBlrCoins();
      accesstoken = _data['access'];
      email = _data['email'];
      _oflineref.setString("username", email);
      _oflineref.setString("access_token", accesstoken);
      notifyListeners();
    } catch (e) {
      throw "There is something wrong use another email";
    }
  }
  //const url = "https://serverxx.azurewebsites.net/api/user/login";

  Future<bool> login(String email, String password) async {
    final _oflineref = await SharedPreferences.getInstance();

    try {
      final _respond = await http.post(
          Uri.parse('https://serverxx.azurewebsites.net/api/user/login'),
          body: {'username': email, 'password': password});
      final _data = Map.from(json.decode(_respond.body));

      _data.forEach((key, value) {
        data[key] = value;
      });
      getBlrCoins();
      accesstoken = _data['access'];
      email = _data['email'];
      _oflineref.setString("username", email);
      _oflineref.setString("access_token", accesstoken);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
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
