import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/interface/database/hive_box.dart';

abstract class ConfigurationsDataStoreInterface {
  T fetch<T>(Configuration key);
  void save<T>(Configuration key, T value);
}

class ConfigurationsDataStore extends ConfigurationsDataStoreInterface {
  ConfigurationsDataStore._();

  static final ConfigurationsDataStore instance = ConfigurationsDataStore._();

  static final _key = HiveBox.configurations.toString();

  static Future openBox() {
    return Hive.openBox(_key);
  }

  final Box _box = Hive.box(_key);

  ValueListenable listenable() {
    return _box.listenable();
  }

  @override
  T fetch<T>(Configuration key) {
    return _box.get(key.toString());
  }

  @override
  void save<T>(Configuration key, T value) {
    _box.put(key.toString(), value);
  }
}

enum Configuration {
  isDarkMode,
  isHandWriting,
  primaryColorValue,
}
