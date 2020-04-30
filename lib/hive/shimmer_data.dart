import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:shimmer/hive/shimmer_category.dart';

part 'shimmer_data.g.dart';

@HiveType(typeId: 0)
class ShimmerData {
  @HiveField(0)
  DateTime createdDate = DateTime.now();

  @HiveField(1)
  ShimmerCategory category = ShimmerCategory.plane;

  @HiveField(2)
  DateTime date = DateTime.now();

  @HiveField(3)
  String title = '';

  @HiveField(4)
  String summary = '';

  @HiveField(5)
  String detail = '';

  @HiveField(6)
  String note = '';

  @HiveField(7)
  String theme = '';

  @HiveField(8)
  List<Uint8List> images = [];

  @HiveField(9)
  List<String> tags = [];

  @HiveField(10)
  double star = 3;

  @HiveField(11)
  String creator = '';

  @HiveField(12)
  String location = '';

  @HiveField(13)
  String genre = '';

  @HiveField(14)
  String option1 = '';

  @HiveField(15)
  String option2 = '';

  @HiveField(16)
  String option3 = '';
}
