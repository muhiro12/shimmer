import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/model/shimmer_logs.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';
import 'package:shimmer/scaffold/settings_scaffold.dart';
import 'package:shimmer/widget/empty_page.dart';
import 'package:shimmer/widget/floating_action_button/create_floating_action_button.dart';
import 'package:shimmer/widget/timeline/card_timeline.dart';

class HomeScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: _onPressed,
          ),
        ],
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: ShimmerLogsRepository.instance.listenable(),
          builder: (context, box, widget) {
            ShimmerLogsRepository.instance.load();
            final ShimmerLogs logs =
                ShimmerLogsRepository.instance.fetchPublished();
            if (logs.value.isEmpty) {
              return EmptyPage();
            }
            return CardTimeline(logs);
          },
        ),
      ),
      floatingActionButton: CreateFloatingActionButton(),
    );
  }

  void _onPressed() {
    SettingsScaffold.showAsModal();
  }
}
