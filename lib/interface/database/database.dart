import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/interface/database/hive_box.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';

class Database {
  static Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ShimmerLogAdapter());
    Hive.registerAdapter(ShimmerCategoryAdapter());
    await Hive.openBox<ShimmerLog>(HiveBox.shimmerLogs.toString());
    await Hive.openBox(HiveBox.configurations.toString());
  }

  static Future deInit() async {
    await Hive.close();
  }
}
