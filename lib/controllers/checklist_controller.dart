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
    final _respond = await http
        .get(Uri.parse("http://10.0.2.2:8000/api/get_checklist/$id"), headers: {
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
    final _res = await http
        .post(Uri.parse("http://10.0.2.2:8000/api/checklist_ticket/$pk"),
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

  // List<CheckModel> docs = [

  //   CheckModel(page: [
  //     SubList(nya: "Underwear"),
  //     SubList(nya: "Socks"),
  //     SubList(nya: "Sleepwear"),
  //     SubList(nya: "Shirts, polos"),
  //     SubList(nya: "Jeans, trousers, shorts"),
  //     SubList(nya: "Dresses, skirts"),
  //     SubList(nya: "Shoes, sneakers"),
  //     SubList(nya: "Flipflops, slippers"),
  //     SubList(nya: "Jackets, coats, raincoats"),
  //     SubList(nya: "Belts, ties"),
  //     SubList(nya: "Scarves, hats, gloves")
  //   ], nya: "Clothes"),
  //   CheckModel(page: [
  //     SubList(nya: "Suitcases, backpack"),
  //     SubList(nya: "Itinerary"),
  //     SubList(nya: "Maps and directions"),
  //     SubList(nya: "Language guide"),
  //     SubList(nya: "Travel guide"),
  //     SubList(nya: "Travel pillow, sleeping mask, earplugs"),
  //     SubList(nya: "Travel locks"),
  //     SubList(nya: "Luggage tags"),
  //     SubList(nya: "Pens and paper"),
  //     SubList(nya: "Snacks, drinks"),
  //     SubList(nya: "Small pocket knife (not in carry-on!)"),
  //     SubList(nya: "Rope, expandable clothesline")
  //   ], nya: "Travel aids"),
  //   CheckModel(page: [
  //     SubList(nya: "Cellphone, charger"),
  //     SubList(nya: "Photo camera, memorycard, charger"),
  //     SubList(nya: "Laptop, iPad or Tablet, E-reader, chargers"),
  //     SubList(nya: "Travel adapter and converter"),
  //     SubList(nya: "Travel iron"),
  //     SubList(nya: "Flashlight"),
  //     SubList(nya: "Headphones"),
  //   ], nya: "Appliances"),
  //   CheckModel(page: [
  //     SubList(nya: "Medications, pain reliever"),
  //     SubList(nya: "Masks"),
  //     SubList(nya: "First aid kit"),
  //     SubList(nya: "Insect repellent"),
  //     SubList(nya: "Oral Rehydration Solution (ORS)"),
  //     SubList(nya: "Mosquito net"),
  //     SubList(nya: "Birth control, condoms"),
  //     SubList(nya: "Vaccines, health/dental checkup"),
  //     SubList(nya: "Vitamins"),
  //     SubList(nya: "Hand sanatizer/desinfectant")
  //   ], nya: "Health"),
  //   CheckModel(page: [
  //     SubList(nya: "Toothbrush, paste, dental floss"),
  //     SubList(nya: "Deodorant"),
  //     SubList(nya: "Tweezers (not in carry-on!)"),
  //     SubList(nya: "Soap, shampoo, conditioner"),
  //     SubList(nya: "Towels"),
  //     SubList(nya: "Nailcare"),
  //     SubList(nya: "Tissues, toilet roll"),
  //     SubList(nya: "Feminine hygiene"),
  //     SubList(nya: "Makeup, makeup remover"),
  //     SubList(nya: "Shaving supplies"),
  //     SubList(nya: "Skin products"),
  //     SubList(nya: "Brush, comb, hairproducts"),
  //     SubList(nya: "Glasses, contact lenses, supplies"),
  //   ], nya: "Toiletries"),
  //   CheckModel(page: [
  //     SubList(nya: "Swimsuit and big towel"),
  //     SubList(nya: "Walking shoes"),
  //     SubList(nya: "Sunglasses"),
  //     SubList(nya: "Sunscreen"),
  //     SubList(nya: "Umbrella"),
  //     SubList(nya: "Daypack"),
  //     SubList(nya: "Books, e-books, magazines"),
  //   ], nya: "General activities")
  // ];
}
