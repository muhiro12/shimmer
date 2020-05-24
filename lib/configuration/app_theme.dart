import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/configuration/app_parameter.dart';

class AppTheme {
  AppTheme(this._primaryColor, this._isHandWriting);

  final MaterialColor _primaryColor;
  final bool _isHandWriting;

  ThemeData light() {
    final themeData = _themeData(Brightness.light);
    return themeData;
  }

  ThemeData dark() {
    final themeData = _themeData(Brightness.dark);
    return themeData.copyWith(
      primaryColor: _primaryColor,
      accentColor: _primaryColor,
      toggleableActiveColor: _primaryColor,
      floatingActionButtonTheme: themeData.floatingActionButtonTheme.copyWith(
        foregroundColor: Colors.white,
        backgroundColor: _primaryColor,
      ),
      cardColor: Colors.grey.shade900,
    );
  }

  ThemeData _themeData(Brightness brightness) {
    final themeData = ThemeData(
      primarySwatch: _primaryColor,
      fontFamily: _isHandWriting ? GoogleFonts.sedgwickAve().fontFamily : '',
      brightness: brightness,
    );
    return themeData.copyWith(
      appBarTheme: themeData.appBarTheme.copyWith(
        color: themeData.canvasColor,
        textTheme: themeData.primaryTextTheme.copyWith(
          headline6: themeData.textTheme.headline6.copyWith(
            fontSize: 20,
          ),
        ),
        iconTheme: themeData.iconTheme,
      ),
      dividerTheme: themeData.dividerTheme.copyWith(
        space: AppParameter.zero,
      ),
    );
  }
}
