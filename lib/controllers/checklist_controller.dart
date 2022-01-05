import 'dart:convert';
import 'dart:developer';
import 'package:airplane/model/checklist_model.dart';
import 'package:airplane/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CheckController extends ChangeNotifier {
  CheckController(Auth auth, String id) {
    getchecklist(auth, id);
  }

  bool load = false;
  bool startload = false;

  Map<String, dynamic> x = {
    "Documents": [],
    "Financial": [],
    "Clothes": [],
    "Travel Aids": [],
    "Appliances": [],
    "Health": [],
    "Toiletries": [],
    "Genral Activity": [],
  };

  Future<void> getchecklist(Auth auth, String id) async {
    startload = true;
    notifyListeners();
    final _respond = await http.get(
        Uri.parse("https://serverxx.azurewebsites.net/api/get_checklist/$id"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": 'Bearer ${auth.accesstoken}'
        });
    final Map<String, dynamic> map = json.decode(_respond.body);
    if (map['data'].isNotEmpty) {
      final __data = ChecklistList.fromJson(map['data'][0]);
      x["Documents"] = __data.documents;
      x["Financial"] = __data.financial;
      x["Clothes"] = __data.clothes;
      x["Travel Aids"] = __data.travelaids;
      x["Appliances"] = __data.appliances;
      x["Health"] = __data.health;
      x["Toiletries"] = __data.toiletries;
      x["Genral Activity"] = __data.genralActivity;
    }
    startload = false;
    notifyListeners();
  }

  Future<void> addListtodb(String pk, Auth auth) async {
    load = true;
    notifyListeners();

    final _res = await http.post(
        Uri.parse(
            "https://serverxx.azurewebsites.net/api/checklist_ticket/$pk"),
        body: json.encode({
          "Toiletries": x['Toiletries'].cast<String>(),
          "General activities": x['Genral Activity'].cast<String>(),
          "Appliances": x['Appliances'].cast<String>(),
          "Documents": x['Documents'].cast<String>(),
          "Travel aids": x['Travel Aids'].cast<String>(),
          "Health": x['Health'].cast<String>(),
          "Clothes": x['Clothes'].cast<String>(),
          "Financial": x['Financial'].cast<String>(),
        }),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": 'Bearer ${auth.accesstoken}'
        });
    load = false;
    notifyListeners();
    log(_res.body);
  }

  List<Map<String, List<String>>> mainData = [
    {
      "Documents": [
        "Passport",
        "Visa",
        "Travel insurance",
        "letter prescriber",
        "List of medications",
        "Health insurance card",
        "Tickets",
        "Copies of passport, tickets etc",
        "Boarding pass",
        "Drivers licence",
        "Student card"
      ]
    },
    {
      "Financial": [
        "Foreign currency",
        "Emergency money",
        "Extra wallet",
        "Money belt"
      ]
    },
    {
      "Clothes": ["Underwear", "Socks", "Sleepwear", "Shirts, polos"]
    },
    {
      "Travel Aids": ["Suitcases", "backpack"]
    },
    {
      "Appliances": ["Cellphone", "charger"]
    },
    {
      "Health": ["Toothbrush, paste, dental floss"],
    },
    {
      "Toiletries": ["Glasses, contact lenses, supplies"],
    },
    {
      "Genral Activity": ["Books, e-books, magazines"],
    },
  ];
  void addToUi(String title, String data) {
    x[title].add(data);
    notifyListeners();
  }

  void removeToUi(String title, String data) {
    x[title].remove(data);
    notifyListeners();
  }
}
