import 'package:airplane/model/checklist_model.dart';
import 'package:flutter/cupertino.dart';

class CheckController extends ChangeNotifier{
  bool isSelected = false;
  List<CheckModel> docs = [CheckModel(page: ["Passport","Visa","Travel insurance","letter prescriber","List of medications","Health insurance card","Tickets","Copies of passport, tickets etc","Boarding pass","Drivers licence","Student card"],nya:"Documents" ),
    CheckModel(page:["Foreign currency", "Emergency money", "Credit card", "debit card", "Extra wallet", "Money belt"],nya:"Financial"),
    CheckModel(page:["Underwear","Socks","Sleepwear", "Shirts, polos", "Jeans, trousers, shorts", "Dresses, skirts", "Shoes, sneakers", "Flipflops, slippers", "Jackets, coats, raincoats", "Belts, ties", "Scarves, hats, gloves"],nya:"Clothes"),
    CheckModel(page:["Suitcases, backpack",
      "Itinerary",
      "Maps and directions",
      "Language guide",
      "Travel guide",
      "Travel pillow, sleeping mask, earplugs",
      "Travel locks",
      "Luggage tags",
      "Pens and paper",
      "Snacks, drinks",
      "Small pocket knife (not in carry-on!)",
      "Rope, expandable clothesline"],nya: "Travel aids"),
    CheckModel(page:["Cellphone, charger"
        "Photo camera, memorycard, charger"
        "Laptop, iPad or Tablet, E-reader, chargers"
        "Travel adapter and converter"
        "Travel iron"
        "Flashlight"
        "Headphones"],nya:"Appliances"),
    CheckModel(page:["Medications, pain reliever",
      "Masks",
      "First aid kit",
      "Insect repellent",
      "Oral Rehydration Solution (ORS)",
      "Mosquito net",
      "Birth control, condoms",
      "Vaccines, health/dental checkup",
      "Vitamins",
      "Hand sanatizer/desinfectant"],nya: "Health"),
    CheckModel(page:[
      "Toothbrush, paste, dental floss",
      "Deodorant",
      "Tweezers (not in carry-on!)",
      "Soap, shampoo, conditioner",
      "Towels",
      "Nailcare",
      "Tissues, toilet roll",
      "Feminine hygiene",
      "Makeup, makeup remover",
      "Shaving supplies",
      "Skin products",
      "Brush, comb, hairproducts",
      "Glasses, contact lenses, supplies",
    ],nya: "Toiletries"),
    CheckModel(page:[
      "Swimsuit and big towel",
      "Walking shoes",
      "Sunglasses",
      "Sunscreen",
      "Umbrella",
      "Daypack",
      "Books, e-books, magazines",
    ] ,nya:"General activities")];



}