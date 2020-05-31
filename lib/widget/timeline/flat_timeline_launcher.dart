import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/model/shimmer_logs.dart';
import 'package:shimmer/scaffold/flat_timeline_scaffold.dart';
import 'package:shimmer/widget/timeline/timeline_launcher.dart';

class FlatTimelineLauncher extends TimelineLauncher {
  FlatTimelineLauncher(ShimmerLogs _logs) : super(_logs);

  @override
  void launch(BuildContext context, ShimmerLogs logs) {
    FlatTimelineScaffold.push(context, logs.value.first.state);
  }
}
