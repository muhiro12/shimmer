import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_log_state.dart';
import 'package:shimmer/model/shimmer_logs.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';
import 'package:shimmer/widget/floating_action_button/create_floating_action_button.dart';
import 'package:shimmer/widget/timeline/flat_timeline.dart';

class FlatTimelineScaffold extends StatelessWidget {
  FlatTimelineScaffold(this._state);

  final ShimmerLogState _state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_state.toUpperCamelCaseString()),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: ShimmerLogsRepository.instance.listenable(),
          builder: (context, box, widget) {
            ShimmerLogs logs = ShimmerLogsRepository.instance.load();
            switch (_state) {
              case ShimmerLogState.draft:
                logs = ShimmerLogsRepository.instance.fetchDraft();
                break;
              case ShimmerLogState.archived:
                logs = ShimmerLogsRepository.instance.fetchArchived();
                break;
            }
            return FlatTimeline(logs);
          },
        ),
      ),
      floatingActionButton: CreateFloatingActionButton(),
    );
  }

  static void push(BuildContext context, ShimmerLogState state) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FlatTimelineScaffold(state),
      ),
    );
  }
}
