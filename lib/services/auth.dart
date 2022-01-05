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
  void getToken() async {
    final _oflineref = await SharedPreferences.getInstance();
    accesstoken = _oflineref.getString('access_token') ?? '';
    email = _oflineref.getString('username') ?? '';
    data['email'] = email;
    notifyListeners();
  }

  Future<void> logout() async {
    final _oflineref = await SharedPreferences.getInstance();
    accesstoken = '';
    email = '';
    data = {};
    _oflineref.setString("access_token", '');
    _oflineref.setString('username', '');
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
      accesstoken = _data['access'];
      email = _data['email'];
      _oflineref.setString("username", email);
      _oflineref.setString("access_token", accesstoken);
      notifyListeners();
    } catch (e) {
      throw "There is something wrong use another email";
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
      _data.forEach((key, value) {
        data[key] = value;
      });
      _oflineref.setString("username", email);
      _oflineref.setString("access_token", accesstoken);
      accesstoken = _data['access'];
      email = _data['username'];
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
