import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/hive/data_box.dart';
import 'package:shimmer/hive/shimmer_data_list.dart';
import 'package:shimmer/shimmer/card_summary.dart';

class HomeNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (_) => MaterialPageRoute(
        builder: (context) => ValueListenableBuilder(
          valueListenable: Hive.box(DataBox.key.toString()).listenable(),
          builder: (context, box, widget) {
            final ShimmerDataList dataList = box.get(
              DataBox.dataList.toString(),
              defaultValue: ShimmerDataList(),
            );
            return ListView(
              children: dataList.value
                  .map(
                    (data) => ShimmerCardSummary(data),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
