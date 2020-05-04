import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_log_data_store.dart';
import 'package:shimmer/model/shimmer_log_repository.dart';
import 'package:shimmer/widget/category_list_item.dart';

class CategoryScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: ShimmerLogDataStore.listenableLog,
          builder: (context, box, widget) {
            final grouped = ShimmerLogRepository.fetchLogsGroupedByCategory();
            return ListView(
              children: grouped.keys
                  .map(
                    (key) => CategoryListItem(
                      key,
                      grouped[key].length,
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
