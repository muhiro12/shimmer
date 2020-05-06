import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';

part 'shimmer_log.g.dart';

@HiveType(typeId: 0)
class ShimmerLog {
  ShimmerLog({
    this.category = ShimmerCategory.plain,
    DateTime date,
    this.title = '',
    this.summary = '',
    this.detail = '',
    this.star = 3,
    this.tags = const [],
    this.images = const [],
    this.location = '',
    this.creator = '',
    this.genre = '',
    this.theme = '',
    this.note = '',
  }) {
    this.date = date ?? DateTime.now();
  }

  @HiveField(0)
  String key = UniqueKey().toString();

  @HiveField(1)
  DateTime createdDate = DateTime.now();

  @HiveField(2)
  ShimmerCategory category;

  @HiveField(3)
  DateTime date;

  @HiveField(4)
  String title;

  @HiveField(5)
  String summary;

  @HiveField(6)
  String detail;

  @HiveField(7)
  double star;

  @HiveField(8)
  List<String> tags;

  @HiveField(9)
  List<Uint8List> images;

  @HiveField(10)
  String location;

  @HiveField(11)
  String creator;

  @HiveField(12)
  String genre;

  @HiveField(13)
  String theme;

  @HiveField(14)
  String note;
}
