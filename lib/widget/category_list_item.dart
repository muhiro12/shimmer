import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/scaffold/category_timeline_scaffold.dart';

class CategoryListItem extends StatelessWidget {
  final ShimmerCategory _category;

  CategoryListItem(this._category);

  @override
  Widget build(BuildContext context) {
    final title = EnumParser.upperCamelCaseStringOf(_category);
    return ListTile(
      title: Text(title),
      onTap: () => _pushToTimeline(context, _category),
    );
  }

  void _pushToTimeline(BuildContext context, ShimmerCategory category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CategoryTimelineScaffold(category),
      ),
    );
  }
}
