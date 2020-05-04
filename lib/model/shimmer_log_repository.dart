import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/interface/database/shimmer_log_data_store.dart';

class ShimmerLogRepository {
  static Map<ShimmerCategory, List<ShimmerLog>> fetchLogsGroupedByCategory() {
    List<ShimmerLog> logs = ShimmerLogDataStore.fetchLogs();
    Map<ShimmerCategory, List<ShimmerLog>> grouped = {};
    ShimmerCategory.values.forEach(
      (category) {
        final values = logs.where((log) => log.category == category).toList();
        if (values.isNotEmpty) {
          grouped[category] = values;
        }
      },
    );
    return grouped;
  }
}
