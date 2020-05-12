import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/model/shimmer_logs.dart';
import 'package:shimmer/scaffold/category_timeline_scaffold.dart';

class AlbumListItem extends StatelessWidget {
  AlbumListItem(this._logs);

  final ShimmerLogs _logs;

  @override
  Widget build(BuildContext context) {
    final title = EnumParser.upperCamelCaseStringOf(_logs.key);
    return ListTile(
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '(${_logs.value.length})',
            style: Theme.of(context).textTheme.body1.copyWith(
                  color: Colors.grey,
                ),
          ),
          Icon(Icons.keyboard_arrow_right),
        ],
      ),
      onTap: () => _onTap(context, _logs.key),
    );
  }

  void _onTap(BuildContext context, ShimmerCategory category) {
    CategoryTimelineScaffold.push(context, category);
  }
}
