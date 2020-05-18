import 'package:shimmer/interface/database/shimmer_log_state.dart';
import 'package:shimmer/model/shimmer_logs.dart';

class AlbumItem {
  AlbumItem({
    this.state,
    this.logs,
  });

  final ShimmerLogState state;
  final ShimmerLogs logs;
}
