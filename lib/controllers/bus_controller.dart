import 'package:airplane/model/bus_model.dart';
import 'package:airplane/widgets/bus.dart';
import 'package:flutter/cupertino.dart';

class BusController extends ChangeNotifier {
  List<BusModel> docs = [
    BusModel(page: [
      BusList(
          nya:
              "From BEML Layout 5th stage to Kempegowda International Airport."),
      BusList(
          nya:
              "Schedule: 04:30 am, 06:40 am, 09:45 am, 11:55 am, 17:50 pm, 19:20 pm. The ride takes 02:25 h.")
    ], nya: "KIAS-2"),
    BusModel(page: [
      BusList(nya: "From HAL Main Gate to Kempegowda International Airport."),
      BusList(
          nya:
              "Stops: Indiranagar Police Station, Tippasandra, Millers Road, Coles Park, Military Dairy Farm, Kempegowda International Airport. "),
      BusList(
          nya: "Schedule: From 01:00 am to 23:00 pm. The ride takes 01:55 h.")
    ], nya: "KIAS-4"),
    BusModel(page: [
      BusList(nya: "From Whitefield TTMC to Kempegowda International Airport."),
      BusList(
          nya: "Schedule: From 08:15 am to 13:00 pm. The ride takes 02:15 h.")
    ], nya: "KIAS-4A"),
    BusModel(page: [
      BusList(
          nya: "From Banashankari TTMC to Kempegowda International Airport."),
      BusList(
          nya:
              "Stops: Jayanagara 5th Block, Jayanagara 4th Block, Ashoka Pillar, Richmond Circle, Wilson Garden Police Station, RM Guttahalli, Mekhri Circle, Hebbala, Kempegowda International Airport."),
      BusList(
          nya: "Schedule: From 01:35 am am to 22:45 pm. The ride takes 2:00 h.")
    ], nya: "KIAS-5"),
    BusModel(page: [
      BusList(
          nya: "From Jambusavari dinne to Kempegowda International Airport."),
      BusList(
          nya:
              "Stops: RM Guttahalli, Wilson Garden Police Station, Mekhri Circle, Kempegowda International Airport."),
      BusList(
          nya: "Schedule: From 04:25 am to 20:25 pm. The ride takes 02:00 h.")
    ], nya: "KIAS-5A"),
    BusModel(page: [
      BusList(
          nya:
              "From Bannerughatta Circle to Kempegowda International Airport."),
      BusList(
          nya: "Schedule: From 04:30 am to 20:40 pm. The ride takes 02:25 h.")
    ], nya: "KIAS-5B"),
    BusModel(page: [
      BusList(nya: "From Isro Layout to Kempegowda International Airport."),
      BusList(nya: "Schedule: 00:05 am, 21:10 pm. The ride takes 01:45 h.")
    ], nya: "KIAS-5C"),
    BusModel(page: [
      BusList(nya: "From Gottigere to Kempegowda International Airport."),
      BusList(nya: "Schedule: 09:45 am, 10:45 pm. The ride takes 02:10 h.")
    ], nya: "KIAS-5G"),
    BusModel(page: [
      BusList(nya: "From Kadugodi to Kempegowda International Airport."),
      BusList(
          nya:
              "Stops: Kadugodi, Military Dairy Farm, Kempegowda International Airport."),
      BusList(
          nya: "Schedule: From 00:00 am to 23:20 pm. The ride takes 02:10 h.")
    ], nya: "KIAS-6"),
    BusModel(page: [
      BusList(nya: "From Kadugodi to Kempegowda International Airport."),
      BusList(
          nya:
              "Schedule: 05:30 am, 10:05 am, 19:00 pm. The ride takes 02:00 h.")
    ], nya: "KIAS-6A"),
    BusModel(page: [
      BusList(nya: "From HSR BDA Complex to Kempegowda International Airport."),
      BusList(
          nya:
              "Stops: Bangalore Dairy Circle, HSR BDA Complex, John Fowler, Jn of Hosur Road, Jakkasandra, Richmond Circle, Wilson Garden Police Station, RM Guttahalli, Mekhri Circle, Military Daily Farm, Hebbala, Kempegowda International Airport."),
      BusList(
          nya: "Schedule: From 00:30 am to 23:35 pm. The ride takes 01:55 h.")
    ], nya: "KIAS-7"),
    BusModel(page: [
      BusList(nya: "From HSR BDA Complex to Kempegowda International Airport."),
      BusList(
          nya:
              "Stops: Jn of New Bridge, HSR BDA Complex, Jakkasandra, Jn of 80 and 100 Feet Road, Domlur TTMC Bus Stand, Shivajinagar Bus Station, Millitari Accounts Office, RM Guttahalli, Mayohall, Raj Bhavan, Mekhri Circle, Hebbala Military Dair Farm, Kempegowda International Airport."),
      BusList(
          nya: "Schedule: From 06:10 am to 23:35 pm. The ride takes 02:00 h.")
    ], nya: "KIAS-7A"),
    BusModel(page: [
      BusList(nya: "From Electronic City to Kempegowda International Airport."),
      BusList(
          nya:
              "Stops: Electronic City, Konappana Agrahara, Electronic City Infosys Gate, Kudlu Gate, Singasandra, Bommanahalli,Hosa Road, Mahadevapura Cross, Maratahalli Bridge, HSR Apartment, City Light Apt, Depot-25-BS, Kada Bisanahalli, Dodda Nekkundi, Agara Junction, Sarjapura Cross, BChannasandra, Veeranna Palya, Kalyana Nagara, Jn of Nagavara, Jn of Kasturi Nagara, Babusab Palya, KR Puram Railway Station, Military Dairy Farm, Hebbala, Kempegowda International Airport."),
      BusList(
          nya:
              "Schedule: From 00:40 am am to 23:55 pm. The ride takes 02:45 h.")
    ], nya: "KIAS-8"),
    BusModel(page: [
      BusList(nya: "From Kuvempunagar to Kempegowda International Airport."),
      BusList(
          nya:
              "Schedule: 08:15 am, 09:40 am, 10:30 am, 13:15 pm, 20:35 pm, 22:45 pm. Total trip time is 02:00 h.")
    ], nya: "KIAS-8A"),
    BusModel(page: [
      BusList(
          nya: "From Banashankari TTMC to Kempegowda International Airport."),
      BusList(nya: "Schedule: 05:00 am, 20:45 pm. Total trip time is 02:10 h.")
    ], nya: "KIAS-8B"),
    BusModel(page: [
      BusList(nya: "From Chandapura to Kempegowda International Airport."),
      BusList(
          nya:
              "Schedule: From 04:30 am to 19:50 pm. Total trip time is 03:00 h.")
    ], nya: "KIAS-8C"),
    BusModel(page: [
      BusList(nya: "From Dodda Kannalli to Kempegowda International Airport."),
      BusList(
          nya:
              "Schedule: From 04:00 am to 19:00 pm. Total trip time is 02:00 h.")
    ], nya: "KIAS-8D"),
    BusModel(page: [
      BusList(
          nya:
              "From Electronic City Wipro Gate to Kempegowda International Airport."),
      BusList(
          nya:
              "Schedule: 12:00 pm, 16:40 pm, 18:00 pm. Total trip time is 02:35 h.")
    ], nya: "KIAS-8EW"),
    BusModel(page: [
      BusList(
          nya:
              "From Kempegowda Bus Station to Kempegowda International Airport."),
      BusList(
          nya:
              "Stops: Kempegowda Bus Station, RM Guttahalli, Shivananda store, Mekhri Cricle, Military Dairy Farm, Kogliu Cross Devanahalli Main Road, Kodigehalli gate, Hebbala, Byatarayanapura, Kempegowda International Airport."),
      BusList(
          nya: "Schedule: From 00:30 am to 23:50 pm. The ride takes 01:15 h.")
    ], nya: "KIAS-9"),
    BusModel(page: [
      BusList(
          nya:
              "From Mysore Road Satellite Bus Stand to Kempegowda International Airport."),
      BusList(
          nya:
              "Stops: Attiguppe, Mysore Road Satellite Bus Stand, Magadi Road TollGate, Mekhri Circle, Military Dairy Farm, Hebbala, Kempegowda International Airport."),
      BusList(
          nya: "Schedule: From 00:30 am to 22:50 pm. The ride takes 02:10 h.")
    ], nya: "KIAS-10"),
    BusModel(page: [
      BusList(
          nya: "From Padmanabha Nagara to Kempegowda International Airport."),
      BusList(
          nya: "Schedule: 07:30 am to 22:20 pm. Total trip time is 01:50 h.")
    ], nya: "KIAS-11"),
    BusModel(page: [
      BusList(nya: "From BTM Layout to Kempegowda International Airport."),
      BusList(
          nya:
              "Stops: JP Nagara 3rd Phase, Water Tank Raggigudda, BTM Layout, Jayanagara 4th Block, Ashoka Pillar, Wilson Garden Police Station, Corporation, High Ground Police Station, RM Guttahalli, Mekhri Circle, Hebbala, Military Dairy Farm, Kempegowda International Airport."),
      BusList(
          nya: "Schedule: From 00:25 am to 23:05 pm. The ride takes 02:00 h. ")
    ], nya: "KIAS-12"),
    BusModel(page: [
      BusList(
          nya:
              "From Royal Meenakshi Mall to Kempegowda International Airport."),
      BusList(
          nya: "Schedule: 05:30 am to 23:15 pm. Total trip time is 02:00 h.")
    ], nya: "KIAS-14"),
    BusModel(page: [
      BusList(
          nya: "From White Field TTMC to Kempegowda International Airport."),
      BusList(
          nya: "Schedule: 06:15 am to 21:15 pm. Total trip time is 01:40 h.")
    ], nya: "KIAS-15")
  ];
}
