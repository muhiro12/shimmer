import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/model/shimmer_logs.dart';
import 'package:shimmer/widget/flat_list/flat_list_tile.dart';

abstract class TimelineLauncher extends FlatListTile {
  TimelineLauncher(this._logs) : super();

  final ShimmerLogs _logs;

  @override
  Widget build(BuildContext context) {
    return FlatListTile(
      title: Text(_logs.key),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '(${_logs.value.length})',
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Colors.grey,
                ),
          ),
          Icon(Icons.keyboard_arrow_right),
        ],
      ),
      onTap: () => launch(context, _logs),
    );
  }

  void launch(BuildContext context, ShimmerLogs logs);
}
