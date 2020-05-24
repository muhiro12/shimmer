import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/interface/database/shimmer_log_state.dart';
import 'package:shimmer/model/shimmer_logs.dart';

class TestData {
  static final List<ShimmerLog> logList = <ShimmerLog>[
    ShimmerLog(
      state: ShimmerLogState.published,
      category: ShimmerCategory.plain,
      date: DateTime(1),
    ),
    ShimmerLog(
      state: ShimmerLogState.published,
      category: ShimmerCategory.concert,
      date: DateTime(200),
    ),
    ShimmerLog(
      state: ShimmerLogState.published,
      category: ShimmerCategory.plain,
      date: DateTime(30),
    ),
    ShimmerLog(
      state: ShimmerLogState.published,
      category: ShimmerCategory.book,
      date: DateTime(4000),
    ),
    ShimmerLog(
      state: ShimmerLogState.archived,
      category: ShimmerCategory.plain,
      date: DateTime(50),
    ),
    ShimmerLog(
      category: ShimmerCategory.book,
      date: DateTime(6),
    ),
  ];

  static final ShimmerLogs logs = ShimmerLogs(
    value: logList,
  );
}
