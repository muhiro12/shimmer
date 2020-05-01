import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/hive/configuration_box.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/hive/shimmer_data_box.dart';

class DataStore {
  static Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ShimmerCategoryAdapter());
    Hive.registerAdapter(ShimmerDataAdapter());
    await Hive.openBox(ConfigurationBox.key.toString());
    await Hive.openBox<ShimmerData>(ShimmerDataBox.key.toString());
  }

  static Future deInit() async {
    await Hive.close();
  }
}
