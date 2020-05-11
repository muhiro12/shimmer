import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';

class CategorizedLogs {
  CategorizedLogs(
    this.category,
    this.logs,
  );

  final ShimmerCategory category;
  final List<ShimmerLog> logs;
}
