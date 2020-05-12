import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/model/shimmer_logs.dart';

class ShimmerLogsParser {
  ShimmerLogsParser(this._logs);

  final ShimmerLogs _logs;

  List<ShimmerLogs<ShimmerCategory>> toCategorizedLogsList() {
    List<ShimmerLogs<ShimmerCategory>> albumItems = [];
    ShimmerCategory.values.forEach(
      (category) {
        final logs = _logs.value
            .where(
              (log) => log.category == category,
            )
            .toList();
        albumItems.add(
          ShimmerLogs(
            key: category,
            value: logs,
          ),
        );
      },
    );
    albumItems.sort(
      (left, right) => right.value.length.compareTo(
        left.value.length,
      ),
    );
    return albumItems.where((item) => item.value.isNotEmpty).toList();
  }
}
