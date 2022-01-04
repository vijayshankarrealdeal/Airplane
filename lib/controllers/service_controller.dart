import 'package:airplane/model/service_model.dart';
import 'package:flutter/cupertino.dart';

class ServiceController extends ChangeNotifier {
  List<ServiceModel> docs = [
    ServiceModel(page: [
      SubList(nya: """BLR Domestic Lounge : First level. Open 24 hours. Services: Premium food, Snacks, Wi-Fi, Flight monitors, Newspapers, Magazines, TV, Internet terminals and smoking area.

Services available upon payment: Alcoholic drinks, Conference rooms, Printers, Copiers."""),
      SubList(nya: """BLR International Lounge : Close to the smoking area. Open 24 hours. Services: Premium food, Snacks, Wi-Fi, Flight monitors, Newspapers, Magazines, TV, Internet terminals, Telephones. Please note it is a non-smoking facility.

Services available upon payment: Alcoholic drinks, Printers, Copiers."""),
      SubList(nya: """Air India Maharajah Lounge :  First level, Domestic area. Open from 04:30 am to last departure. Services: Snacks, Wi-Fi, Newspapers, Magazines, TV, Internet terminals. Please note it is a non-smoking facility."""),
    ], nya: "LOUNGES"),
    ServiceModel(page: [
      SubList(
          nya:
              """There’s free Wi-Fi available at Bangalore Airport. It is needed to register first and then a password is sent to the smartphone.

There are also internet stations airside.""")
    ], nya: "WI-FI"),
    ServiceModel(page: [
      SubList(
          nya:
              """Wheelchair and buggy rental service is available, please ask to the airport staff for more information.""")
    ], nya: "DISABLED SERVICES"),
    ServiceModel(page: [
      SubList(
          nya:
              """For lost items and belongings, please contact Bangalore Airport Lost & Found. 

Lost & Found call: +91 8066 782257""")
    ], nya: "LOST & FOUND"),
    ServiceModel(page: [SubList(nya: """There are plenty of ATMs throughout the terminal.""")], nya: "ATMS"),
    ServiceModel(page: [SubList(nya: """The Day Hotel is located on the second level (Domestic Departures). Open 24 hours. Only for passengers with boarding passes or flight tickets.

All transfer passengers can accommodate here with cozy rooms and a plenty of services to amend their stay. It counts with 20 rooms of different categories according to passenger’s needs.

Services: Free Wi-Fi, premium lounge, private restaurant and spa are available.

Fares: Single room from RS 2,500 (3 hours), Rs 3,500 (6 hours). Additional hours: Rs 500.

Shower package: From Rs 500.""")], nya: "THE DAY HOTEL"),
    ServiceModel(page: [SubList(nya: """On airside there are some free sleep pods to take a nap.""")], nya: "SLEEP PODS"),
    ServiceModel(page: [SubList(nya: """Smoking is permitted only in designated smoking lounges inside the terminal (International and Domestic), on the kerbside (Departures and Arrivals) and at The Quad by BLR. Follow the signage or check at the nearest information desk for directions.  """)], nya: "SMOKING AREAS"),
    ServiceModel(page: [SubList(nya: """There is no luggage storage service at Bangalore Airport.""")], nya: "LUGGAGE STORAGE"),
    ServiceModel(page: [SubList(nya: """- Information Counter
- Self-service check-in kiosks
- Currency exchange
- Child care room
- Interactive Voice Response System
- Luggage carts
- Rest rooms
- Prayer rooms
- Showers""")], nya: "OTHER SERVICES")
  ];
}
