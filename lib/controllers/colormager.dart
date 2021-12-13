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
      return const Color(0xfff9f9f9);
    } else {
      return const Color(0xff121212);
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

  Color appBarColor() {
    if (!darkmode) {
      return Colors.white60;
    } else {
      return Colors.black54;
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
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color bottomnavBaractieIcons() {
    if (!darkmode) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  Color formPlaceholder() {
    if (!darkmode) {
      return Colors.grey;
    } else {
      return Colors.grey.shade400;
    }
  }

  Color bottomnavBarInactieIcons() {
    if (!darkmode) {
      return Colors.grey;
    } else {
      return Colors.grey.shade800;
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
      return Colors.red.shade900;
    } else {
      return Colors.red.shade400;
    }
  }

  Color nowarning() {
    if (!darkmode) {
      return Colors.green.shade900;
    } else {
      return Colors.green.shade400;
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
      return Colors.yellow.shade700;
    } else {
      return Colors.yellow.shade600;
    }
  }

  Color orange() {
    if (!darkmode) {
      return Colors.orangeAccent;
    } else {
      return Colors.orange;
    }
  }
}
