import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/data_store/shimmer_data_data_store.dart';
import 'package:shimmer/model/parser/enum_parser.dart';
import 'package:shimmer/widget/common/timeline.dart';

class CategoryTimelineScaffold extends StatelessWidget {
  final ShimmerCategory _category;

  CategoryTimelineScaffold(this._category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(EnumParser.upperCamelCaseStringOf(_category)),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: ShimmerDataDataStore.listenableShimmerData,
          builder: (context, box, widget) {
            final List<ShimmerData> shimmerDataList =
                ShimmerDataDataStore.fetchShimmerDataList()
                    .where(
                      (shimmerData) => shimmerData.category == _category,
                    )
                    .toList();
            return Timeline(shimmerDataList);
          },
        ),
      ),
    );
  }
}
