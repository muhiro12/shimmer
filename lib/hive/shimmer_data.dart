import 'package:hive/hive.dart';
import 'package:shimmer/hive/shimmer_category.dart';

part 'shimmer_data.g.dart';

@HiveType(typeId: 1)
class ShimmerData {
  @HiveField(0)
  DateTime date = DateTime.now();

  @HiveField(1)
  String title = 'Jive Turkey';

  @HiveField(2)
  String summary = 'Live at Tokyo';

  @HiveField(3)
  String detail = 'So greate, I\'m happy.';

  @HiveField(4)
  List<String> tags = ['#Tag'];

  @HiveField(5)
  ShimmerCategory category = ShimmerCategory.concert;

  @HiveField(6)
  String artist = 'the HIATUS';

  @HiveField(7)
  String location = 'Tokyo';
}
