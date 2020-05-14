import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log_state.dart';
import 'package:shimmer/model/shimmer_logs.dart';

class ShimmerLogsParser {
  ShimmerLogsParser(this.logs);

  ShimmerLogs logs;

  ShimmerLogs _clone() {
    return ShimmerLogs(
      key: logs.key,
      value: List.from(logs.value),
    );
  }

  ShimmerLogs sortedByDate() {
    final ShimmerLogs logs = _clone();
    return ShimmerLogs(
      key: logs.key,
      value: logs.value
        ..sort(
          (left, right) => right.date.compareTo(left.date),
        ),
    );
  }

  ShimmerLogs whereOfPublished() {
    return logs.where(
      (log) => log.state == ShimmerLogState.published,
    );
  }

  ShimmerLogs whereOfDraft() {
    return logs.where(
      (log) => log.state == ShimmerLogState.draft,
    );
  }

  ShimmerLogs whereOfArchived() {
    return logs.where(
      (log) => log.state == ShimmerLogState.archived,
    );
  }

  List<ShimmerLogs<ShimmerCategory>> toCategorizedLogsList() {
    final ShimmerLogs logs = _clone();
    List<ShimmerLogs<ShimmerCategory>> albumItems = [];
    ShimmerCategory.values.forEach(
      (category) {
        final value = logs.value
            .where(
              (log) => log.category == category,
            )
            .toList();
        albumItems.add(
          ShimmerLogs(
            key: category,
            value: value,
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
