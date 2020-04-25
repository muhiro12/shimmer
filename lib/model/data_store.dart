import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/hive/configuration_box.dart';
import 'package:shimmer/hive/data_box.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/hive/shimmer_data_list.dart';

class DataStore {
  static final _dataBox = Hive.box(DataBox.key.toString());
  static final _configurationBox = Hive.box(ConfigurationBox.key.toString());

  static final listenableData = _dataBox.listenable();
  static final listenableConfiguration = _configurationBox.listenable();

  static Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ShimmerCategoryAdapter());
    Hive.registerAdapter(ShimmerDataAdapter());
    Hive.registerAdapter(ShimmerDataListAdapter());
    await Hive.openBox(ConfigurationBox.key.toString());
    await Hive.openBox(DataBox.key.toString());
  }

  static void saveData(ShimmerData data) {
    ShimmerDataList dataList = _dataBox.get(
      DataBox.dataList.toString(),
      defaultValue: ShimmerDataList(),
    );
    dataList.insert(data);
    saveDataList(dataList);
  }

  static ShimmerDataList fetchDataList() {
    return _dataBox.get(
      DataBox.dataList.toString(),
      defaultValue: ShimmerDataList(),
    );
  }

  static void saveDataList(ShimmerDataList dataList) {
    _dataBox.put(
      DataBox.dataList.toString(),
      dataList,
    );
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
