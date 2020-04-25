import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/model/route_navigator.dart';
import 'package:shimmer/widget/shimmer_card.dart';

class CategoryRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: SafeArea(
        child: ListView(
          children: ShimmerCategory.values.map(
            (category) {
              final title = EnumParser.upperCamelCaseStringOf(category);
              return ListTile(
                title: Text(title),
                onTap: () => _onListItemTap(context, title),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  void _onListItemTap(BuildContext context, String title) {
    RouteNavigator.push(
      context: context,
      widget: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SafeArea(
          child: Center(
            child: ShimmerCard(
              child: Text('Contents'),
            ),
          ),
        ),
      ),
    );
  }
}
