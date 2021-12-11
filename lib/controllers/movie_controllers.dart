import 'dart:convert';

import 'package:airplane/model/movie.dart';
import 'package:airplane/model/shop_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MovieController extends ChangeNotifier {
  MovieController() {
    call();
    shopCalling();
  }
  List<Results> _results = [];
  List<Results> get result => _results;

  List<ShopData> _shop = [];
  List<ShopData> get resultshop => _shop;
  bool load = true;
  void call() async {
    String host = "10.0.2.2:5000";
    try {
      load = false;
      final _response =
          await http.get(Uri.parse('http://$host/getlatestmovies/'));
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
    String host = "10.0.2.2:5000";
    try {
      final _response = await http.get(Uri.parse('http://$host/getshoping/n'));
      Map<String, dynamic> _daa = json.decode(_response.body);
      ShoppingModel shoppingModel = ShoppingModel.fromJson(_daa);
      _shop = shoppingModel.data;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }
}
