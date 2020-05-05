import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';

part 'shimmer_log.g.dart';

@HiveType(typeId: 0)
class ShimmerLog {
  @HiveField(0)
  DateTime createdDate = DateTime.now();

  @HiveField(1)
  ShimmerCategory category = ShimmerCategory.plain;

  @HiveField(2)
  DateTime date = DateTime.now();

  @HiveField(3)
  String title = '';

  @HiveField(4)
  String summary = '';

  @HiveField(5)
  String detail = '';

  @HiveField(6)
  double star = 3;

  @HiveField(7)
  List<String> tags = [];

  @HiveField(8)
  List<Uint8List> images = [];

  @HiveField(9)
  String location = '';

  @HiveField(10)
  String creator = '';

  @HiveField(11)
  String genre = '';

  @HiveField(12)
  String theme = '';

  @HiveField(13)
  String note = '';
}
