import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';
import 'package:shimmer/widget/category_list_item.dart';
import 'package:shimmer/widget/create_floating_action_button.dart';
import 'package:shimmer/widget/empty_page.dart';

class AlbumScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album'),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: ShimmerLogsRepository.instance.listenable(),
          builder: (context, box, widget) {
            final albumItems = ShimmerLogsRepository.instance.fetchAlbumItems();
            if (albumItems.isEmpty) {
              return EmptyPage();
            }
            return ListView(
              children: albumItems
                  .map(
                    (albumItem) => AlbumListItem(albumItem),
                  )
                  .toList(),
            );
          },
        ),
      ),
      floatingActionButton: CreateFloatingActionButton(),
    );
  }
}
