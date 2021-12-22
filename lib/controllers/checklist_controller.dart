import 'package:airplane/model/checklist_model.dart';
import 'package:flutter/cupertino.dart';

class CheckController extends ChangeNotifier {
  List<CheckModel> docs = [
    CheckModel(page: [
      SubList(nya: "Passport"),
      SubList(nya: "Visa"),
      SubList(nya: "Travel insurance"),
      SubList(nya: "letter prescriber"),
      SubList(nya: "List of medications"),
      SubList(nya: "Health insurance card"),
      SubList(nya: "Tickets"),
      SubList(nya: "Copies of passport, tickets etc"),
      SubList(nya: "Boarding pass"),
      SubList(nya: "Drivers licence"),
      SubList(nya: "Student card")
    ], nya: "Documents"),
    CheckModel(page: [
      SubList(nya: "Foreign currency"),
      SubList(nya: "Emergency money"),
      SubList(nya: "Credit card"),
      SubList(nya: "debit card"),
      SubList(nya: "Extra wallet"),
      SubList(nya: "Money belt"),
    ], nya: "Financial"),
    CheckModel(page: [
      SubList(nya: "Underwear"),
      SubList(nya: "Socks"),
      SubList(nya: "Sleepwear"),
      SubList(nya: "Shirts, polos"),
      SubList(nya: "Jeans, trousers, shorts"),
      SubList(nya: "Dresses, skirts"),
      SubList(nya: "Shoes, sneakers"),
      SubList(nya: "Flipflops, slippers"),
      SubList(nya: "Jackets, coats, raincoats"),
      SubList(nya: "Belts, ties"),
      SubList(nya: "Scarves, hats, gloves")
    ], nya: "Clothes"),
    CheckModel(page: [
      SubList(nya: "Suitcases, backpack"),
      SubList(nya: "Itinerary"),
      SubList(nya: "Maps and directions"),
      SubList(nya: "Language guide"),
      SubList(nya: "Travel guide"),
      SubList(nya: "Travel pillow, sleeping mask, earplugs"),
      SubList(nya: "Travel locks"),
      SubList(nya: "Luggage tags"),
      SubList(nya: "Pens and paper"),
      SubList(nya: "Snacks, drinks"),
      SubList(nya: "Small pocket knife (not in carry-on!)"),
      SubList(nya: "Rope, expandable clothesline")
    ], nya: "Travel aids"),
    CheckModel(page: [
      SubList(nya: "Cellphone, charger"),
      SubList(nya: "Photo camera, memorycard, charger"),
      SubList(nya: "Laptop, iPad or Tablet, E-reader, chargers"),
      SubList(nya: "Travel adapter and converter"),
      SubList(nya: "Travel iron"),
      SubList(nya: "Flashlight"),
      SubList(nya: "Headphones"),
    ], nya: "Appliances"),
    CheckModel(page: [
      SubList(nya: "Medications, pain reliever"),
      SubList(nya: "Masks"),
      SubList(nya: "First aid kit"),
      SubList(nya: "Insect repellent"),
      SubList(nya: "Oral Rehydration Solution (ORS)"),
      SubList(nya: "Mosquito net"),
      SubList(nya: "Birth control, condoms"),
      SubList(nya: "Vaccines, health/dental checkup"),
      SubList(nya: "Vitamins"),
      SubList(nya: "Hand sanatizer/desinfectant")
    ], nya: "Health"),
    CheckModel(page: [
      SubList(nya: "Toothbrush, paste, dental floss"),
      SubList(nya: "Deodorant"),
      SubList(nya: "Tweezers (not in carry-on!)"),
      SubList(nya: "Soap, shampoo, conditioner"),
      SubList(nya: "Towels"),
      SubList(nya: "Nailcare"),
      SubList(nya: "Tissues, toilet roll"),
      SubList(nya: "Feminine hygiene"),
      SubList(nya: "Makeup, makeup remover"),
      SubList(nya: "Shaving supplies"),
      SubList(nya: "Skin products"),
      SubList(nya: "Brush, comb, hairproducts"),
      SubList(nya: "Glasses, contact lenses, supplies"),
    ], nya: "Toiletries"),
    CheckModel(page: [
      SubList(nya: "Swimsuit and big towel"),
      SubList(nya: "Walking shoes"),
      SubList(nya: "Sunglasses"),
      SubList(nya: "Sunscreen"),
      SubList(nya: "Umbrella"),
      SubList(nya: "Daypack"),
      SubList(nya: "Books, e-books, magazines"),
    ], nya: "General activities")
  ];
}
