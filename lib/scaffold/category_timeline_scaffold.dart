import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/model/enum_parser.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';
import 'package:shimmer/widget/create_floating_action_button.dart';
import 'package:shimmer/widget/timeline.dart';

class CategoryTimelineScaffold extends StatelessWidget {
  CategoryTimelineScaffold(this._category);

  final ShimmerCategory _category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(EnumParser.upperCamelCaseStringOf(_category)),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: ShimmerLogsRepository.instance.listenable(),
          builder: (context, box, widget) {
            final List<ShimmerLog> logs = ShimmerLogsRepository.instance
                .fetchAllSortedByCreatedDate()
                .where(
                  (log) => log.category == _category,
                )
                .toList();
            return Timeline(logs);
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
        builder: (_) => CategoryTimelineScaffold(category),
      ),
    );
  }
}
