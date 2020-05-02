import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/router/router.dart';
import 'package:shimmer/scaffold/category_timeline_scaffold.dart';

class CategoryListItemRouter extends Router {
  final BuildContext _context;
  final ShimmerCategory _category;

  CategoryListItemRouter(this._context, this._category);

  @override
  Widget inject() {
    return CategoryTimelineScaffold(
      _category,
    );
  }

  void push() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => inject(),
      ),
    );
  }
}
