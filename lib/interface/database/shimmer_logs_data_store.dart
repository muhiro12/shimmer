import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/interface/database/hive_box.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';

abstract class ShimmerLogsDataStoreInterface {
  List<ShimmerLog> fetchAll();
  void add(ShimmerLog log);

  Box<ShimmerLog> _box() {
    return Hive.box<ShimmerLog>(
      HiveBox.shimmerLogs.toString(),
    );
  }

  ValueListenable listenable() {
    return _box().listenable();
  }
}

class ShimmerLogsDataStore extends ShimmerLogsDataStoreInterface {
  @override
  List<ShimmerLog> fetchAll() {
    return _box().values.toList();
  }

  @override
  void add(ShimmerLog log) {
    _box().add(log);
  }
}
