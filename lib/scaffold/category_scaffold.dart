import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';
import 'package:shimmer/widget/category_list_item.dart';
import 'package:shimmer/widget/empty_page.dart';

class CategoryScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: ShimmerLogsRepository.instance.listenable(),
          builder: (context, box, widget) {
            final grouped =
                ShimmerLogsRepository.instance.fetchAllGroupedByCategory();
            if (grouped.isEmpty) {
              return EmptyPage();
            }
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
