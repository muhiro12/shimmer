import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/model/shimmer_logs.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';
import 'package:shimmer/widget/floating_action_button/create_floating_action_button.dart';
import 'package:shimmer/widget/timeline/card_timeline.dart';

class CategoryScaffold extends StatelessWidget {
  CategoryScaffold(this._logs);

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
            return CardTimeline(_logs);
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
        builder: (_) => CategoryScaffold(logs),
      ),
    );
  }
}
