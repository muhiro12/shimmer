import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/interface/database/configurations.dart';
import 'package:shimmer/interface/database/hive_box.dart';

abstract class ConfigurationsDataStoreInterface {
  Configurations load();
  void save(Configurations configurations);
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
  Configurations load() {
    return _box.get(
      _key,
      defaultValue: Configurations(),
    );
  }

  @override
  void save(Configurations configurations) {
    _box.put(_key, configurations);
  }
}
