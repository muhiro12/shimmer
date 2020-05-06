import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/scaffold/category_timeline_scaffold.dart';

class CategoryListItem extends StatelessWidget {
  CategoryListItem(this._category, this._count);

  final ShimmerCategory _category;
  final int _count;

  @override
  Widget build(BuildContext context) {
    final title = EnumParser.upperCamelCaseStringOf(_category);
    return ListTile(
      title: Text(title),
      trailing: Text('($_count)'),
      onTap: () => _onTap(context, _category),
    );
  }

  void _onTap(BuildContext context, ShimmerCategory category) {
    CategoryTimelineScaffold.push(context, category);
  }
}
