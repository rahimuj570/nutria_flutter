import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: .light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: .fromWidth(.maxFinite),
        padding: .all(14),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: .circular(8)),
      ),
    ),
  );

  static ThemeData get darkTheme => ThemeData();
}
