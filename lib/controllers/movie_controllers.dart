import 'dart:convert';

import 'package:airplane/model/movie.dart';
import 'package:airplane/model/shop_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieController extends ChangeNotifier {
  MovieController() {
    call();
    shopCalling();
    runInternational();
  }
  List<Results> _results = [];
  List<Results> get result => _results;

  List<ShopData> _shop = [];
  List<ShopData> get resultshop => _shop;
  List<ShopData> _shopInter = [];
  List<ShopData> get resultshopInter => _shopInter;
  bool load = true;
  void call() async {
    String host = "https://airlinefly.azurewebsites.net/api/getmovies";
    try {
      load = false;
      final _response = await http.get(Uri.parse(host));
      Map<String, dynamic> _daa = json.decode(_response.body);
      MovieLatest movieLatest = MovieLatest.fromJson(_daa);
      _results = movieLatest.results ?? [];
      load = true;
      notifyListeners();
    } catch (e) {
      load = false;
      notifyListeners();
    }
  }

  void shopCalling() async {
    String host = "https://airlinefly.azurewebsites.net";
    try {
      final _response = await http.get(Uri.parse('$host/api/shop/n'));
      Map<String, dynamic> _daa = json.decode(_response.body);
      ShoppingModel shoppingModel = ShoppingModel.fromJson(_daa);
      _shop = shoppingModel.data;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  void runInternational() async {
    String host = "10.0.2.2:5000";
    try {
      final _response = await http.get(Uri.parse('http://$host/getshoping/I'));
      Map<String, dynamic> _daa = json.decode(_response.body);
      ShoppingModel shoppingModel = ShoppingModel.fromJson(_daa);
      _shopInter = shoppingModel.data;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }
}
