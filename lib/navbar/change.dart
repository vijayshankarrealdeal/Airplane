import 'package:flutter/cupertino.dart';

class ChangeofPage extends ChangeNotifier {
  int pageIndex = 0;
  final double size = 30;

  Color active = CupertinoColors.black;
  void kCallback(int index) {
    pageIndex = index;
    for (int i = 0; i < 4; i++) {
      if (i == pageIndex) {
        acti[i] = true;
      } else {
        acti[i] = false;
      }
    }
    notifyListeners();
  }

  Map<int, bool> acti = {
    0: true,
    1: false,
    //2: false,
    //  3: false,
  };
}
