import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/model/data_store/shimmer_data_data_store.dart';
import 'package:shimmer/widget/common/timeline.dart';
import 'package:shimmer/widget/settings/settings_scaffold.dart';

class HomeScaffold extends StatelessWidget {
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
          valueListenable: ShimmerDataDataStore.listenableShimmerData,
          builder: (context, box, widget) {
            final List<ShimmerData> shimmerDataList =
                ShimmerDataDataStore.fetchShimmerDataList().toList();
            return Timeline(shimmerDataList);
          },
        ),
      ),
    );
  }

  void _onSettingsIconPressed(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => SettingsScaffold(),
    );
  }
}
