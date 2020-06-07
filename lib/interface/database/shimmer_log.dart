import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log_state.dart';

part 'shimmer_log.g.dart';

@HiveType(typeId: 1)
class ShimmerLog extends HiveObject {
  ShimmerLog({
    DateTime updatedAt,
    this.state = ShimmerLogState.draft,
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
  final String key = UniqueKey().toString();

  @HiveField(1)
  final DateTime createdAt = DateTime.now();

  @HiveField(2)
  DateTime updatedAt = DateTime.now();

  @HiveField(3)
  ShimmerLogState state;

  @HiveField(10)
  ShimmerCategory category;

  @HiveField(11)
  DateTime date;

  @HiveField(12)
  String title;

  @HiveField(13)
  String summary;

  @HiveField(14)
  String detail;

  @HiveField(15)
  double star;

  @HiveField(16)
  List<String> tags;

  @HiveField(17)
  List<Uint8List> images;

  @HiveField(18)
  String location;

  @HiveField(19)
  String creator;

  @HiveField(20)
  String genre;

  @HiveField(21)
  String theme;

  @HiveField(22)
  String note;
}
