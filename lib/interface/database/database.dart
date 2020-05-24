import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/interface/database/configurations.dart';
import 'package:shimmer/interface/database/configurations_data_store.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/interface/database/shimmer_log_state.dart';
import 'package:shimmer/interface/database/shimmer_logs_data_store.dart';

class Database {
  static Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ShimmerLogAdapter());
    Hive.registerAdapter(ShimmerCategoryAdapter());
    Hive.registerAdapter(ShimmerLogStateAdapter());
    Hive.registerAdapter(ConfigurationsAdapter());
    await ShimmerLogsDataStore.openBox();
    await ConfigurationsDataStore.openBox();
  }

  static Future deInit() async {
    await Hive.close();
  }
}
