import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/model/shimmer_card_creator_type.dart';
import 'package:shimmer/model/shimmer_logs.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';
import 'package:shimmer/scaffold/shimmer_card_creator_scaffold.dart';
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
                  background: ColoredBox(
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: ListTile(
                        leading: Icon(
                          Icons.restore,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  secondaryBackground: ColoredBox(
                    color: Theme.of(context).disabledColor,
                    child: Center(
                      child: ListTile(
                        trailing: Text(
                          'Delete',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ),
                  child: FlatTimelineItem(log),
                  onDismissed: (direction) => _onDismissed(
                    context,
                    log,
                    direction,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  void _onDismissed(
    BuildContext context,
    ShimmerLog log,
    DismissDirection direction,
  ) {
    _logs.value.remove(log);
    if (_logs.value.isEmpty) {
      Navigator.pop(context);
    }
    switch (direction) {
      case DismissDirection.startToEnd:
        _toCardCreator(log);
        break;
      case DismissDirection.endToStart:
        _deleteLog(log);
        break;
      default:
        break;
    }
  }

  void _toCardCreator(ShimmerLog log) {
    ShimmerCardCreatorScaffold.showAsModal(
      log: log,
      type: ShimmerCardCreatorType.edit,
    );
  }

  void _deleteLog(ShimmerLog log) {
    ShimmerLogsRepository.instance.deleteLog(log);
  }
}
