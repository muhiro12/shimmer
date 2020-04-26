import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/hive/configuration_box.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/hive/shimmer_data_box.dart';

class DataStore {
  static final _shimmerDataBox =
      Hive.box<ShimmerData>(ShimmerDataBox.key.toString());
  static final _configurationBox = Hive.box(ConfigurationBox.key.toString());

  static final listenableShimmerData = _shimmerDataBox.listenable();
  static final listenableConfiguration = _configurationBox.listenable();

  static Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ShimmerCategoryAdapter());
    Hive.registerAdapter(ShimmerDataAdapter());
    await Hive.openBox(ConfigurationBox.key.toString());
    await Hive.openBox<ShimmerData>(ShimmerDataBox.key.toString());
  }

  static Future deInit() async {
    await Hive.close();
  }

  static void createShimmerData(ShimmerData shimmerData) {
    saveShimmerDataList(shimmerData);
  }

  static List<ShimmerData> fetchShimmerDataList() {
    return _shimmerDataBox.values.toList().reversed.toList();
  }

  static void saveShimmerDataList(ShimmerData shimmerData) {
    _shimmerDataBox.add(shimmerData);
  }

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
