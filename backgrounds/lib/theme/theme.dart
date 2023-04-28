import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _dartTheme = false;
  bool _customTheme = false;

  bool get dartTheme => _dartTheme;
  bool get customTheme => _customTheme;

  set dartTheme(bool value) {
    _customTheme = false;
    _dartTheme = value;
    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _dartTheme = false;
    notifyListeners();
  }

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _dartTheme = false;
        _customTheme = false;
        break;
      case 2:
        _dartTheme = true;
        _customTheme = false;
        break;
      case 3:
        _dartTheme = false;
        _customTheme = true;
        break;
      default:
        _dartTheme = false;
        _customTheme = false;
    }
  }

  ThemeData get currentTheme {
    if (_dartTheme) {
      return ThemeData.dark();
    } else if (_customTheme) {
      return ThemeData.light();
    } else {
      return ThemeData.light();
    }
  }
}
