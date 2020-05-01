import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/hive/configuration_box.dart';

class ConfigurationDataStore {
  static final _configurationBox = Hive.box(ConfigurationBox.key.toString());
  static final listenableConfiguration = _configurationBox.listenable();

  static bool fetchHandWriting() {
    return _configurationBox.get(
      ConfigurationBox.handWriting.toString(),
      defaultValue: false,
    );
  }

  static void saveHandWriting(bool value) {
    _configurationBox.put(
      ConfigurationBox.handWriting.toString(),
      value,
    );
  }

  static bool fetchDarkMode() {
    return _configurationBox.get(
      ConfigurationBox.darkMode.toString(),
      defaultValue: false,
    );
  }

  static void saveDarkMode(bool value) {
    _configurationBox.put(
      ConfigurationBox.darkMode.toString(),
      value,
    );
  }

  static MaterialColor fetchPrimaryColor() {
    final colorValue = _configurationBox.get(
      ConfigurationBox.primaryColorValue.toString(),
      defaultValue: Colors.blue.value,
    );
    return Colors.primaries.firstWhere(
      (color) => color.value == colorValue,
    );
  }

  static void savePrimaryColor(MaterialColor color) {
    _configurationBox.put(
      ConfigurationBox.primaryColorValue.toString(),
      color.value,
    );
  }
}
