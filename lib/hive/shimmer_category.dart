import 'package:hive/hive.dart';

part 'shimmer_category.g.dart';

@HiveType(typeId: 1)
enum ShimmerCategory {
  @HiveField(0)
  plane,

  @HiveField(1)
  concert,

  @HiveField(2)
  movie,

  @HiveField(3)
  book,

  @HiveField(4)
  cafe,

  @HiveField(5)
  museum,
}
