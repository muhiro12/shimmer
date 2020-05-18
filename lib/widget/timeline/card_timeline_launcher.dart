import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/model/shimmer_logs.dart';
import 'package:shimmer/scaffold/category_scaffold.dart';
import 'package:shimmer/widget/timeline/timeline_launcher.dart';

class CardTimelineLauncher extends TimelineLauncher {
  CardTimelineLauncher(ShimmerLogs _logs) : super(_logs);

  @override
  void onTap(BuildContext context, ShimmerLogs logs) {
    CategoryScaffold.push(context, logs);
  }
}
