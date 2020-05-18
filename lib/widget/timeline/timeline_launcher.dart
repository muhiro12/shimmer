import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/model/shimmer_logs.dart';

abstract class TimelineLauncher extends StatelessWidget {
  TimelineLauncher(this._logs);

  final ShimmerLogs _logs;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
      onTap: () => onTap(context, _logs),
    );
  }

  void onTap(BuildContext context, ShimmerLogs logs);
}
