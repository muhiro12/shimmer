import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/model/shimmer_logs.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';
import 'package:shimmer/widget/floating_action_button/create_floating_action_button.dart';
import 'package:shimmer/widget/timeline/card_timeline.dart';

class CategoryScaffold extends StatelessWidget {
  CategoryScaffold(this._category);

  final ShimmerCategory _category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_category.toUpperCamelCaseString()),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: ShimmerLogsRepository.instance.listenable(),
          builder: (context, box, widget) {
            ShimmerLogsRepository.instance.load();
            ShimmerLogs logs =
                ShimmerLogsRepository.instance.fetchCategorized(_category);
            return CardTimeline(logs);
          },
        ),
      ),
      floatingActionButton: CreateFloatingActionButton(),
    );
  }

  static void push(BuildContext context, ShimmerCategory category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CategoryScaffold(category),
      ),
    );
  }
}
