import 'package:flutter/cupertino.dart';
import 'package:shimmer/model/shimmer_logs.dart';
import 'package:shimmer/widget/timeline/flat_timeline_item.dart';
import 'package:shimmer/widget/timeline/timeline.dart';

class FlatTimeline extends Timeline {
  FlatTimeline(this._logs) : super(_logs);

  final ShimmerLogs _logs;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _logs.value
          .map(
            (log) => FlatTimelineItem(log),
          )
          .toList(),
    );
  }
}
