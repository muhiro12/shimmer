import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/router/router.dart';
import 'package:shimmer/scaffold/category_timeline_scaffold.dart';

class CategoryTimelineScaffoldRouter extends Router {
  final BuildContext context;
  final ShimmerCategory category;

  CategoryTimelineScaffoldRouter(
      {this.context, this.category = ShimmerCategory.plain});

  @override
  CategoryTimelineScaffold injected() {
    return CategoryTimelineScaffold(
      category,
    );
  }

  void push() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => injected(),
      ),
    );
  }
}
