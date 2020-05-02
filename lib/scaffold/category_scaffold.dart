import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/database/shimmer_category.dart';
import 'package:shimmer/widget/category_list_item.dart';

class CategoryScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: SafeArea(
        child: ListView(
          children: ShimmerCategory.values
              .map(
                (category) => CategoryListItem(category),
              )
              .toList(),
        ),
      ),
    );
  }
}
