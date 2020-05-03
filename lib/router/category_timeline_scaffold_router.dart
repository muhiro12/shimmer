import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/router/router.dart';
import 'package:shimmer/scaffold/category_timeline_scaffold.dart';

class CategoryTimelineScaffoldRouter extends Router {
  final BuildContext _context;
  final ShimmerCategory _category;

  CategoryTimelineScaffoldRouter(this._context, this._category);

  @override
  CategoryTimelineScaffold injected() {
    return CategoryTimelineScaffold(
      _category,
    );
  }

  void push() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => injected(),
      ),
    );
  }
}
