import 'package:flutter/cupertino.dart';
import 'package:shimmer/model/shimmer_logs.dart';
import 'package:shimmer/widget/timeline_item.dart';

class Timeline extends StatelessWidget {
  Timeline(this._logs);

  final ShimmerLogs _logs;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _logs.value
          .map(
            (log) => TimelineItem(log),
          )
          .toList(),
    );
  }
}
