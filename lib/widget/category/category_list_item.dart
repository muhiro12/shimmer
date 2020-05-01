import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/model/parser/enum_parser.dart';
import 'package:shimmer/model/route_navigator.dart';
import 'package:shimmer/widget/category/category_timeline_scaffold.dart';

class CategoryListItem extends StatelessWidget {
  final ShimmerCategory _category;

  CategoryListItem(this._category);

  @override
  Widget build(BuildContext context) {
    final title = EnumParser.upperCamelCaseStringOf(_category);
    return ListTile(
      title: Text(title),
      onTap: () => _onListItemTap(context, _category),
    );
  }

  void _onListItemTap(BuildContext context, ShimmerCategory category) {
    RouteNavigator.push(
      context: context,
      widget: CategoryTimelineScaffold(category),
    );
  }
}
