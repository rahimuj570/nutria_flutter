import 'package:flutter/material.dart';
import 'package:neutria/app/const_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: "Poppins",
    appBarTheme: AppBarTheme(
      backgroundColor: ConstColors.lightScafoldColor,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: .w500,
        color: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: ConstColors.lightScafoldColor,
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
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        fixedSize: .fromWidth(.maxFinite),
        padding: .all(14),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: .circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: .circular(8)),
      prefixIconColor: ConstColors.lightGreyTextColor,
      suffixIconColor: ConstColors.lightGreyTextColor,
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.black),
    ),
  );

  static ThemeData get darkTheme => ThemeData(fontFamily: "Poppins");
}
