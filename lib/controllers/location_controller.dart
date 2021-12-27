import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationTaker extends ChangeNotifier {
  LocationTaker() {
    seelocation();
  }
  bool locationenable = true;
  bool notification = true;
  void seelocation() async {
    final _ref = await SharedPreferences.getInstance();
    locationenable = _ref.getBool('location_key') ?? true;
    notification = _ref.getBool('get_not') ?? false;
    notifyListeners();
  }

  void tooglenotification() async {
    final _ref = await SharedPreferences.getInstance();
    if (notification == true) {
      notification = false;
      _ref.setBool("get_not", false);
      notifyListeners();
    } else {
      notification = true;
      _ref.setBool("get_not", true);
      notifyListeners();
    }
  }

  void toggle() async {
    final _ref = await SharedPreferences.getInstance();
    if (locationenable == true) {
      locationenable = false;
      _ref.setBool("location_key", false);
      notifyListeners();
    } else {
      locationenable = true;
      _ref.setBool("location_key", true);
      notifyListeners();
    }
  }
}
