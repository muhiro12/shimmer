import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/database/configuration_box.dart';
import 'package:shimmer/database/shimmer_category.dart';
import 'package:shimmer/database/shimmer_log.dart';
import 'package:shimmer/database/shimmer_log_box.dart';

class DataStore {
  static Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ShimmerCategoryAdapter());
    Hive.registerAdapter(ShimmerLogAdapter());
    await Hive.openBox(ConfigurationBox.key.toString());
    await Hive.openBox<ShimmerLog>(ShimmerLogBox.key.toString());
  }

  static Future deInit() async {
    await Hive.close();
  }
}
