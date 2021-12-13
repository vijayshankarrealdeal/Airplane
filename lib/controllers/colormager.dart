import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorManager extends ChangeNotifier {
  ColorManager() {
    checkmode();
  }
  bool darkmode = false;

  void checkmode() async {
    final _ref = await SharedPreferences.getInstance();
    final systembool = _ref.getBool('darkmode') ?? false;
    darkmode = systembool;
    notifyListeners();
  }

  void applyMode() async {
    final _ref = await SharedPreferences.getInstance();
    if (darkmode == false) {
      darkmode = true;
      notifyListeners();
    } else {
      darkmode = false;
      notifyListeners();
    }
    _ref.setBool('darkmode', darkmode);
  }

  Color colorofScaffold() {
    if (!darkmode) {
      return const Color.fromRGBO(239, 239, 244, 1);
    } else {
      return const Color.fromRGBO(0, 0, 0, 1);
    }
  }

  Color appBarColor() {
    if (!darkmode) {
      return const Color.fromRGBO(249, 249, 249, 0.94);
    } else {
      return const Color.fromRGBO(29, 29, 29, 0.94);
    }
  }

    Color colorofScaffoldroute() {
    if (!darkmode) {
      return const Color.fromRGBO(255, 255, 255, 1);
    } else {
      return const Color.fromRGBO(13, 13, 13, 1);
    }
  }

  Color appBarColorroute() {
    if (!darkmode) {
      return const Color.fromRGBO(249, 249, 249, 0.94);
    } else {
      return const Color.fromRGBO(29, 29, 29, 0.94);
    }
  }

  Color colorofCardShowing() {
    if (!darkmode) {
      return const Color(0xfff8f8f8);
    } else {
      return const Color(0xff333333);
    }
  }

  Map<int, Color> whiteProgress = {
    0: Colors.green.shade800,
    1: Colors.blue.shade700,
    2: Colors.purple.shade700,
    3: Colors.orange.shade700,
    4: Colors.red.shade800,
    5: Colors.black,
  };
  Map<int, Color> blackProgress = {
    0: Colors.green.shade500,
    1: Colors.blue.shade500,
    2: Colors.purple.shade500,
    3: Colors.orange.shade500,
    4: Colors.red.shade500,
    5: Colors.black,
  };
  Color progressCircluaravatar(int i) {
    if (!darkmode) {
      return whiteProgress[i]!;
    } else {
      return blackProgress[i]!;
    }
  }

  Color textColor() {
    if (!darkmode) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  Color buttonInside() {
    if (!darkmode) {
      return Colors.white;
    } else {
      return Colors.white;
    }
  }

  Color buttonOutside() {
    if (!darkmode) {
      return Colors.black;
    } else {
      return Colors.black;
    }
  }

  Color drawerColor() {
    if (!darkmode) {
      return Colors.white;
    } else {
      return Colors.black.withOpacity(0.9);
    }
  }

  Color iconColor() {
    if (!darkmode) {
      return Colors.black.withOpacity(0.8);
    } else {
      return Colors.white.withOpacity(0.8);
    }
  }

  Color bottomnavBar() {
    if (!darkmode) {
      return const Color(0xffF9F9F9);
    } else {
      return const Color(0xff161616);
    }
  }

  Color bottomnavBaractieIcons() {
    if (!darkmode) {
      return const Color(0xff007AFF);
    } else {
      return const Color(0xff0A84FF);
    }
  }

  Color formPlaceholder() {
    if (!darkmode) {
      return const Color.fromRGBO(60, 60, 67, 0.6);
    } else {
      return const Color.fromRGBO(235, 225, 245, 0.6);
    }
  }

  Color bottomnavBarInactieIcons() {
    if (!darkmode) {
      return const Color(0xff999999);
    } else {
      return const Color(0xff757575);
    }
  }

  Color homeListTile() {
    if (!darkmode) {
      return const Color.fromRGBO(249, 249, 249, 0.94);
    } else {
      return const Color.fromRGBO(24, 24, 24, 0.94);
    }
  }

  Color backButton() {
    if (!darkmode) {
      return const Color.fromRGBO(0, 122, 255, 1);
    } else {
      return const Color.fromRGBO(10, 132, 255, 1);
    }
  }

  Color interestTab() {
    if (!darkmode) {
      return Colors.red.shade700;
    } else {
      return Colors.blue.shade900;
    }
  }

  Color warning() {
    if (!darkmode) {
      return const Color(0xffFF3B30);
    } else {
      return const Color(0xffFF453A);
    }
  }

  Color planeCardColorHome() {
    if (!darkmode) {
      return const Color.fromRGBO(255, 255, 255, 1);
    } else {
      return const Color(0xffFF3B30);
    }
  }

  Color purple() {
    if (!darkmode) {
      return const Color(0xffAF52DE);
    } else {
      return const Color(0xffBF5AF2);
    }
  }

  Color nowarning() {
    if (!darkmode) {
      return const Color(0xff34C759);
    } else {
      return const Color(0xff30D158);
    }
  }

  Color folatingButton() {
    if (!darkmode) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color yellow() {
    if (!darkmode) {
      return const Color(0xffFFCC00);
    } else {
      return const Color(0xffFFD60A);
    }
  }

  Color orange() {
    if (!darkmode) {
      return const Color(0xffFF9500);
    } else {
      return const Color(0xffFF9F0A);
    }
  }
}
