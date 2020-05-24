import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/configurations.dart';
import 'package:shimmer/interface/database/configurations_data_store.dart';

class ConfigurationsRepository {
  ConfigurationsRepository(this._dataStore);

  final ConfigurationsDataStoreInterface _dataStore;

  static final ConfigurationsRepository instance =
      ConfigurationsRepository(ConfigurationsDataStore.instance);

  Configurations _cache;

  ValueListenable listenable() {
    return ConfigurationsDataStore.instance.listenable();
  }

  Configurations load() {
    final value = _dataStore.load();
    _cache = value;
    return value;
  }

  void save(Configurations configurations) {
    _dataStore.save(configurations);
  }

  bool fetchIsSystemTheme() {
    return _cache.isSystemTheme;
  }

  void saveIsSystemTheme(bool value) {
    _dataStore.save(
      _cache..isSystemTheme = value,
    );
  }

  bool fetchIsDarkMode() {
    return _cache.isDarkMode;
  }

  void saveIsDarkMode(bool value) {
    _dataStore.save(
      _cache..isDarkMode = value,
    );
  }

  bool fetchIsHandWriting() {
    return _cache.isHandWriting;
  }

  void saveIsHandWriting(bool value) {
    _dataStore.save(
      _cache..isHandWriting = value,
    );
  }

  MaterialColor fetchPrimaryColor() {
    final colorValue = _cache.primaryColorValue;
    return Colors.primaries.firstWhere(
      (color) => color.value == colorValue,
    );
  }

  void savePrimaryColor(MaterialColor color) {
    _dataStore.save(
      _cache..primaryColorValue = color.value,
    );
  }
}
