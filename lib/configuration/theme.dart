import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final MaterialColor primaryColor;
  final bool handwriting;

  AppTheme(this.primaryColor, this.handwriting);

  ThemeData light() {
    final themeData = _themeData(Brightness.light);
    return themeData.copyWith(
      appBarTheme: _appBarTheme(themeData),
    );
  }

  ThemeData dark() {
    final themeData = _themeData(Brightness.dark);
    return themeData.copyWith(
      accentColor: primaryColor,
      toggleableActiveColor: primaryColor,
      floatingActionButtonTheme: themeData.floatingActionButtonTheme.copyWith(
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
      ),
      appBarTheme: _appBarTheme(themeData),
    );
  }

  ThemeData _themeData(Brightness brightness) {
    return ThemeData(
      primarySwatch: primaryColor,
      fontFamily: _fontFamily(),
      brightness: brightness,
    );
  }

  String _fontFamily() {
    return handwriting ? GoogleFonts.sedgwickAve().fontFamily : '';
  }

  AppBarTheme _appBarTheme(ThemeData themeData) {
    return themeData.appBarTheme.copyWith(
      color: themeData.canvasColor,
      textTheme: themeData.primaryTextTheme.copyWith(
        title: themeData.textTheme.title.copyWith(
          fontSize: 20,
        ),
      ),
      iconTheme: themeData.iconTheme,
    );
  }
}
