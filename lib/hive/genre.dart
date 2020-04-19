import 'package:hive/hive.dart';

part 'genre.g.dart';

@HiveType(typeId: 1)
enum Genre {
  @HiveField(0)
  concert,

  @HiveField(1)
  movie,

  @HiveField(2)
  music,

  @HiveField(3)
  musium,

  @HiveField(5)
  plane,
}
