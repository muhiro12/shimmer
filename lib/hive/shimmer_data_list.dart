import 'package:hive/hive.dart';
import 'package:shimmer/hive/shimmer_data.dart';

part 'shimmer_data_list.g.dart';

@HiveType(typeId: 2)
class ShimmerDataList {
  @HiveField(0)
  List<ShimmerData> value = [];

  void create(ShimmerData data) {
    value.insert(0, data);
  }
}
