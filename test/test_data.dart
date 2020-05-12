import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/model/shimmer_logs.dart';

class TestData {
  static List<ShimmerLog> logList() {
    return <ShimmerLog>[
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
    ];
  }

  static ShimmerLogs logs() {
    return ShimmerLogs(
      value: logList(),
    );
  }
}
