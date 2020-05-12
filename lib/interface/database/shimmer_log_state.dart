import 'package:hive/hive.dart';

part 'shimmer_log_state.g.dart';

@HiveType(typeId: 2)
enum ShimmerLogState {
  @HiveField(0)
  published,

  @HiveField(1)
  draft,

  @HiveField(2)
  archived,
}
