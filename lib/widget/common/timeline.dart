import 'package:flutter/cupertino.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/widget/common/timeline_item.dart';

class Timeline extends StatelessWidget {
  final List<ShimmerData> _shimmerDataList;

  Timeline(this._shimmerDataList);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _shimmerDataList
          .map(
            (shimmerData) => TimelineItem(shimmerData),
          )
          .toList(),
    );
  }
}
