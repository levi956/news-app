import 'package:flutter/material.dart';

import '../utils/shared/theme_preference.dart';

class DarkThemeProvider extends ChangeNotifier {
  // creating dark theme object

  // creating an object from the shared_preferences getter and setter
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  // getter for dark theme
  bool get darkTheme => _darkTheme;

  // setter for dark theme and notify listeners
  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
