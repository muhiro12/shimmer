import 'package:flutter/cupertino.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/widget/timeline_item.dart';

class Timeline extends StatelessWidget {
  final List<ShimmerLog> _logList;

  Timeline(this._logList);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _logList
          .map(
            (log) => TimelineItem(log),
          )
          .toList(),
    );
  }
}
