import 'package:flutter/material.dart';
import 'package:neutria/app/services/sharedprefference_service.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.system;

  ThemeMode get getCurrentTheme => _currentTheme;

  Future<void> initTheme() async {
    bool isDark = await SharedprefferenceService.isDarkTheme();
    if (isDark) {
      _currentTheme = ThemeMode.dark;
    } else {
      _currentTheme = ThemeMode.light;
    }
    notifyListeners();
  }

  Future<void> changeTheme({required bool isDarkTheme}) async {
    await SharedprefferenceService.saveTheme(isDarkTheme);
  }
}
