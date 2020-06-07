import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/interface/database/hive_box.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';

abstract class ShimmerLogsDataStoreInterface {
  List<ShimmerLog> load();
  void save(ShimmerLog log);
  void delete(ShimmerLog log);
}

class ShimmerLogsDataStore extends ShimmerLogsDataStoreInterface {
  ShimmerLogsDataStore._();

  static final ShimmerLogsDataStore instance = ShimmerLogsDataStore._();

  static final _key = HiveBox.shimmerLogs.toString();

  static Future openBox() {
    return Hive.openBox<ShimmerLog>(_key);
  }

  Box<ShimmerLog> _box = Hive.box<ShimmerLog>(_key);

  ValueListenable listenable() {
    return _box.listenable();
  }

  @override
  List<ShimmerLog> load() {
    return _box.values.toList();
  }

  @override
  void save(ShimmerLog log) {
    if (log.isInBox) {
      log.save();
    } else {
      _box.put(log.key, log);
    }
  }

  @override
  void delete(ShimmerLog log) {
    log.delete();
  }
}
