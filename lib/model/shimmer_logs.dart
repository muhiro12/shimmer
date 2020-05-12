import 'package:shimmer/interface/database/shimmer_log.dart';

class ShimmerLogs<T> {
  ShimmerLogs({
    this.key,
    this.value,
  });

  final T key;
  final List<ShimmerLog> value;
}
