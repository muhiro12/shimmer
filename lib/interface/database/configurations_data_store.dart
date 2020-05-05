import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/interface/database/hive_box.dart';

abstract class ConfigurationsDataStoreInterface {
  T fetch<T>(Configuration key);
  void save<T>(Configuration key, T value);

  Box _box() {
    return Hive.box(
      HiveBox.configurations.toString(),
    );
  }

  ValueListenable listenable() {
    return _box().listenable();
  }
}

class ConfigurationsDataStore extends ConfigurationsDataStoreInterface {
  @override
  T fetch<T>(Configuration key) {
    return _box().get(key.toString());
  }

  @override
  void save<T>(Configuration key, T value) {
    _box().put(key.toString(), value);
  }
}

enum Configuration {
  isDarkMode,
  isHandWriting,
  primaryColorValue,
}
