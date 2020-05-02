import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/database/shimmer_log.dart';
import 'package:shimmer/model/interface/shimmer_log_data_store.dart';
import 'package:shimmer/scaffold/settings_scaffold.dart';
import 'package:shimmer/widget/timeline.dart';

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
          valueListenable: ShimmerLogDataStore.listenableLog,
          builder: (context, box, widget) {
            final List<ShimmerLog> logList =
                ShimmerLogDataStore.fetchLogList().toList();
            return Timeline(logList);
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