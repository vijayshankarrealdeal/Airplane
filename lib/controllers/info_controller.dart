import 'package:airplane/model/info_model.dart';
import 'package:flutter/cupertino.dart';

class InfoController extends ChangeNotifier{
  List<InfoModel> docs = [
    InfoModel(page: [SuList(nya: """Most airlines require that passengers report at check-in counters two hours before departure for domestic flights and three hours before departure for international flights. Please check with your airline for updates.""")], nya: "Check-In Time"),
    InfoModel(page: [SuList(nya: "Carry your e-ticket or get your boarding pass at the self-check-in kiosks near departure gates."),
    SuList(nya: "Ensure that you have a valid government photo ID for security verification."),
    SuList(nya: "Proceed to the check-in counters to collect your boarding pass/drop luggage."),
    SuList(nya: "Show your boarding pass to CISF to stamp as your pass-through security check.")], nya: "Check-In Procedure"),
    InfoModel(page: [SuList(nya: "Not more than 100 ml of liquids, aerosols, and gels, is permitted."),
    SuList(nya: "Sharp items such as metallic, replica weapons and articles with the potential to cause interference with Civil Aviation operations are not permitted. Such items may be confiscated by the authorities."),
    SuList(nya: "BasketBall"),
    SuList(nya: "Golf Club"),
    SuList(nya: "Cricket Bat"),
    SuList(nya: "Hockey Stick"),
    SuList(nya: "RazorBlade"),
    SuList(nya: "Flammable Items"),
    SuList(nya: "Scissors"),
    SuList(nya: "Knife/Saber"),
    SuList(nya: "Hammer"),
    SuList(nya: "Box Cutter"),
    SuList(nya: "Liquid Battery"),
    SuList(nya: "Gel type Candle"),
    SuList(nya: "Copra"),
    SuList(nya: "Nail Cutter"),
    SuList(nya: "Bow and Arrows"),
    SuList(nya: "Explosives"),
    SuList(nya: "Swiss Knife"),
    SuList(nya: "Aerosols"),
    SuList(nya: "Flare Gun/Air Gun")], nya: "Hand Baggage Restrictions"),
    InfoModel(page: [SuList(nya: "Effective January 17, 2012, as per Ministry of Agriculture, Government of India, carriage of soya beans, chickpeas and safflower seeds to U.S.A is prohibited."),
    SuList(nya: "International passengers, please note:"),
    SuList(nya: "Ensure that your passport and boarding pass is stamped by the Immigration authorities."),
    SuList(nya: "Sikh passengers are not permitted to carry Kirpans.")], nya: "Prohibited Items")
  ];
}