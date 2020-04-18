import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShimmerTheme {
  final MaterialColor primaryColor;

  ShimmerTheme(this.primaryColor);

  ThemeData light() {
    final themeData = ThemeData.light();
    return ThemeData(
      primarySwatch: primaryColor,
      appBarTheme: _appBarTheme(themeData),
      fontFamily: _fontFamily,
    );
  }

  ThemeData dark() {
    final themeData = ThemeData.dark();
    return ThemeData(
      primarySwatch: primaryColor,
      accentColor: primaryColor,
      toggleableActiveColor: primaryColor,
      appBarTheme: _appBarTheme(themeData),
      fontFamily: _fontFamily,
      brightness: Brightness.dark,
    );
  }

  AppBarTheme _appBarTheme(ThemeData themeData) {
    return themeData.appBarTheme.copyWith(
      color: themeData.canvasColor,
    );
  }

  String _fontFamily = GoogleFonts.merienda().fontFamily;
}
