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
    preCalling();
    postCalling();
  }
  List<Results> _results = [];
  List<Results> get result => _results;

  List<ShopData> _shop = [];
  List<ShopData> get resultshop => _shop;
  List<ShopData> _shopInter = [];
  List<ShopData> get resultshopInter => _shopInter;
/////
  List<ShopData> _food = [];
  List<ShopData> get resultfood => _food;
  List<ShopData> _postfood = [];
  List<ShopData> get resultpost => _postfood;

  ///

  bool load = false;
  void call() async {
    try {
      final _response = await http
          .get(Uri.parse('https://serverxx.azurewebsites.net/api/movies'));
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
    try {
      final _response = await http.get(
          Uri.parse('https://serverxx.azurewebsites.net/api/nationalshop'));
      Map<String, dynamic> _daa = json.decode(_response.body);
      ShoppingModel shoppingModel = ShoppingModel.fromJson(_daa);
      _shop = shoppingModel.data;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  void preCalling() async {
    try {
      final _response = await http
          .get(Uri.parse('https://serverxx.azurewebsites.net/api/perfood'));
      Map<String, dynamic> _daa = json.decode(_response.body);
      ShoppingModel shoppingModel = ShoppingModel.fromJson(_daa);
      _food = shoppingModel.data;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  void postCalling() async {
    try {
      final _response = await http
          .get(Uri.parse('https://serverxx.azurewebsites.net/api/postfood'));
      Map<String, dynamic> _daa = json.decode(_response.body);
      ShoppingModel shoppingModel = ShoppingModel.fromJson(_daa);
      _postfood = shoppingModel.data;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  void runInternational() async {
    try {
      final _response = await http.get(Uri.parse(
          'https://serverxx.azurewebsites.net/api/internationalshop'));
      Map<String, dynamic> _daa = json.decode(_response.body);
      ShoppingModel shoppingModel = ShoppingModel.fromJson(_daa);
      _shopInter = shoppingModel.data;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }
}
