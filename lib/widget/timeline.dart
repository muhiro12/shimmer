import 'package:flutter/cupertino.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/widget/timeline_item.dart';

class Timeline extends StatelessWidget {
  final List<ShimmerLog> _logs;

  Timeline(this._logs);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _logs
          .map(
            (log) => TimelineItem(log),
          )
          .toList(),
    );
  }
}
