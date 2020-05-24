import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/model/shimmer_logs.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';
import 'package:shimmer/widget/flat_list/flat_list_section.dart';
import 'package:shimmer/widget/flat_list/flat_list_view.dart';
import 'package:shimmer/widget/timeline/flat_timeline_item.dart';
import 'package:shimmer/widget/timeline/timeline.dart';

class FlatTimeline extends Timeline {
  FlatTimeline(this._logs) : super(_logs);

  final ShimmerLogs _logs;

  @override
  Widget build(BuildContext context) {
    return FlatListView(
      sections: <FlatListSection>[
        FlatListSection(
          tiles: _logs.value
              .map(
                (log) => Dismissible(
                  key: Key(log.key),
                  background: Center(
                    child: ColoredBox(
                      color: Colors.red,
                      child: ListTile(
                        trailing: Text('Delete'),
                      ),
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  child: FlatTimelineItem(log),
                  onDismissed: (_) => _onDismissed(context, log),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  void _onDismissed(BuildContext context, ShimmerLog log) {
    _logs.value.remove(log);
    if (_logs.value.isEmpty) {
      Navigator.pop(context);
    }
    _deleteLog(log);
  }

  void _deleteLog(ShimmerLog log) {
    ShimmerLogsRepository.instance.deleteLog(log);
  }
}
