import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/data_store.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/model/route_navigator.dart';
import 'package:shimmer/widget/timeline_item.dart';

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
                onTap: () => _onListItemTap(context, category),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  void _onListItemTap(BuildContext context, ShimmerCategory category) {
    RouteNavigator.push(
      context: context,
      widget: Scaffold(
        appBar: AppBar(
          title: Text(EnumParser.upperCamelCaseStringOf(category)),
        ),
        body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: DataStore.listenableShimmerData,
            builder: (context, box, widget) {
              final List<ShimmerData> shimmerDataList =
                  DataStore.fetchShimmerDataList()
                      .where(
                        (shimmerData) => shimmerData.category == category,
                      )
                      .toList();
              return ListView(
                children: shimmerDataList
                    .map(
                      (shimmerData) => TimelineItem(shimmerData),
                    )
                    .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
