import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/configurations_data_store.dart';

class ConfigurationsRepository {
  final ConfigurationsDataStoreInterface _dataStore;

  ConfigurationsRepository(this._dataStore);

  static final instance =
      ConfigurationsRepository(ConfigurationsDataStore.instance);

  ValueListenable listenable() {
    return ConfigurationsDataStore.instance.listenable();
  }

  bool fetchIsDarkMode() {
    return _dataStore.fetch(
          Configuration.isDarkMode,
        ) ??
        false;
  }

  void saveIsDarkMode(bool value) {
    _dataStore.save(
      Configuration.isDarkMode,
      value,
    );
  }

  bool fetchIsHandWriting() {
    return _dataStore.fetch(
          Configuration.isHandWriting,
        ) ??
        false;
  }

  void saveIsHandWriting(bool value) {
    _dataStore.save(
      Configuration.isHandWriting,
      value,
    );
  }

  MaterialColor fetchPrimaryColor() {
    final colorValue = _dataStore.fetch<int>(
          Configuration.primaryColorValue,
        ) ??
        Colors.blue.value;
    return Colors.primaries.firstWhere(
      (color) => color.value == colorValue,
    );
  }

  void savePrimaryColor(MaterialColor color) {
    _dataStore.save(
      Configuration.primaryColorValue,
      color.value,
    );
  }
}
