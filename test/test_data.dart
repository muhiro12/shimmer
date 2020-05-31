import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/interface/database/shimmer_log_state.dart';
import 'package:shimmer/model/shimmer_logs.dart';

class TestData {
  static final List<ShimmerLog> logList = <ShimmerLog>[
    ShimmerLog(
      state: ShimmerLogState.published,
      category: ShimmerCategory.plain,
      date: DateTime(0),
    ),
    ShimmerLog(
      state: ShimmerLogState.published,
      category: ShimmerCategory.concert,
      date: DateTime(100),
    ),
    ShimmerLog(
      state: ShimmerLogState.published,
      category: ShimmerCategory.plain,
      date: DateTime(20),
    ),
    ShimmerLog(
      state: ShimmerLogState.published,
      category: ShimmerCategory.book,
      date: DateTime(3000),
    ),
    ShimmerLog(
      state: ShimmerLogState.archived,
      category: ShimmerCategory.plain,
      date: DateTime(40),
    ),
    ShimmerLog(
      category: ShimmerCategory.book,
      date: DateTime(5),
    ),
    ShimmerLog(
      state: ShimmerLogState.draft,
      category: ShimmerCategory.concert,
      date: DateTime(60),
    ),
    ShimmerLog(
      state: ShimmerLogState.archived,
      category: ShimmerCategory.concert,
      date: DateTime(7),
    ),
  ];

  static final ShimmerLogs logs = ShimmerLogs(
    value: logList,
  );
}
