import 'package:hive/hive.dart';
import 'package:shimmer/hive/genre.dart';

part 'shimmer_data.g.dart';

@HiveType(typeId: 0)
class ShimmerData {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String artist;

  @HiveField(3)
  final String location;

  @HiveField(4)
  final Genre genre;

  @HiveField(5)
  final List<String> tags;

  ShimmerData(
    this.date,
    this.title,
    this.artist,
    this.location,
    this.genre,
    this.tags,
  );
}
