import 'package:flutter/material.dart';

class ShimmerTheme {
  final MaterialColor primaryColor;

  ShimmerTheme(this.primaryColor);

  ThemeData light() {
    final themeData = ThemeData.light();
    return ThemeData(
      primarySwatch: primaryColor,
      appBarTheme: _appBarTheme(themeData),
    );
  }

  ThemeData dark() {
    final themeData = ThemeData.dark();
    return ThemeData(
      primarySwatch: primaryColor,
      accentColor: primaryColor,
      toggleableActiveColor: primaryColor,
      appBarTheme: _appBarTheme(themeData),
      brightness: Brightness.dark,
    );
  }

  AppBarTheme _appBarTheme(ThemeData themeData) {
    return themeData.appBarTheme.copyWith(
      color: themeData.canvasColor,
    );
  }
}
