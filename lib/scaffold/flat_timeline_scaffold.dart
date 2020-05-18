import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/model/shimmer_logs.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';
import 'package:shimmer/widget/floating_action_button/create_floating_action_button.dart';
import 'package:shimmer/widget/timeline/flat_timeline.dart';

class FlatTimelineScaffold extends StatelessWidget {
  FlatTimelineScaffold(this._logs);

  final ShimmerLogs _logs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_logs.key),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: ShimmerLogsRepository.instance.listenable(),
          builder: (context, box, widget) {
            final ShimmerLogs logs = ShimmerLogsRepository.instance.fetchAll();
            return FlatTimeline(logs);
          },
        ),
      ),
      floatingActionButton: CreateFloatingActionButton(),
    );
  }

  static void push(BuildContext context, ShimmerLogs logs) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FlatTimelineScaffold(logs),
      ),
    );
  }
}
