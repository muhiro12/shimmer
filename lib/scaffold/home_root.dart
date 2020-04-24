import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/hive/data_box.dart';
import 'package:shimmer/hive/shimmer_data_list.dart';
import 'package:shimmer/scaffold/settings_root.dart';
import 'package:shimmer/widget/home_list_item.dart';

class HomeRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => showCupertinoModalPopup(
              context: context,
              builder: (context) => SettingsRoot(),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: Hive.box(DataBox.key.toString()).listenable(),
          builder: (context, box, widget) {
            final ShimmerDataList dataList = box.get(
              DataBox.dataList.toString(),
              defaultValue: ShimmerDataList(),
            );
            return ListView(
              children: dataList.value
                  .map(
                    (data) => HomeListItem(data),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
