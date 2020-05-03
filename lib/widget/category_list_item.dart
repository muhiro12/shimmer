import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/router/category_timeline_scaffold_router.dart';

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
    CategoryTimelineScaffoldRouter(
      context,
      category,
    ).push();
  }
}
