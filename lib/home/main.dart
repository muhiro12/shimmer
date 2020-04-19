import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/hive/keys.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/shimmer/card_summary.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(HiveKeys.dataBox).listenable(),
      builder: (context, box, widget) {
        final List dataList = box.get(
          HiveKeys.shimmerData,
          defaultValue: List<ShimmerData>(),
        );
        return ListView(
          children: dataList
              .map(
                (data) => ShimmerCardSummary(data),
              )
              .toList(),
        );
      },
    );
  }
}
