import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/interface/database/shimmer_log_state.dart';
import 'package:shimmer/model/shimmer_logs.dart';

class TestData {
  static final List<ShimmerLog> logList = <ShimmerLog>[
    ShimmerLog(
      date: DateTime(1),
      category: ShimmerCategory.plain,
    ),
    ShimmerLog(
      date: DateTime(200),
      category: ShimmerCategory.concert,
    ),
    ShimmerLog(
      date: DateTime(30),
      category: ShimmerCategory.plain,
    ),
    ShimmerLog(
      date: DateTime(4000),
      category: ShimmerCategory.book,
    ),
    ShimmerLog(
      state: ShimmerLogState.archived,
      date: DateTime(50),
      category: ShimmerCategory.plain,
    ),
    ShimmerLog(
      state: ShimmerLogState.draft,
      date: DateTime(6),
      category: ShimmerCategory.book,
    ),
  ];

  static final ShimmerLogs logs = ShimmerLogs(
    value: logList,
  );
}
