import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/hive/shimmer_data_list.dart';
import 'package:shimmer/model/data_store.dart';
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
            onPressed: () => _onSettingsIconPressed(context),
          ),
        ],
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: DataStore.listenableData,
          builder: (context, box, widget) {
            final ShimmerDataList dataList = DataStore.fetchDataList();
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

  void _onSettingsIconPressed(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => SettingsRoot(),
    );
  }
}
