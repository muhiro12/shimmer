import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/widget/flat_list/flat_list_tile.dart';
import 'package:shimmer/widget/timeline/timeline_item.dart';

class FlatTimelineItem extends TimelineItem {
  FlatTimelineItem(this._log) : super(_log);

  final ShimmerLog _log;

  @override
  Widget build(BuildContext context) {
    return FlatListTile(
      title: Text(_log.title),
      subtitle: Text(
        _log.summary,
        maxLines: 1,
      ),
    );
  }
}
