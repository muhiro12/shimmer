import 'package:flutter/cupertino.dart';
import 'package:shimmer/model/shimmer_logs.dart';
import 'package:shimmer/widget/timeline/card_timeline_item.dart';
import 'package:shimmer/widget/timeline/timeline.dart';

class CardTimeline extends Timeline {
  CardTimeline(this._logs) : super(_logs);

  final ShimmerLogs _logs;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _logs.value
          .map(
            (log) => CardTimelineItem(log),
          )
          .toList(),
    );
  }
}
