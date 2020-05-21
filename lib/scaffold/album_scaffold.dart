import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/interface/database/shimmer_log_state.dart';
import 'package:shimmer/model/shimmer_logs_repository.dart';
import 'package:shimmer/widget/empty_page.dart';
import 'package:shimmer/widget/flat_list/flat_list_section.dart';
import 'package:shimmer/widget/flat_list/flat_list_view.dart';
import 'package:shimmer/widget/floating_action_button/create_floating_action_button.dart';
import 'package:shimmer/widget/timeline/card_timeline_launcher.dart';
import 'package:shimmer/widget/timeline/flat_timeline_launcher.dart';

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
            return FlatListView(
              sections: <FlatListSection>[
                FlatListSection(
                  tiles: albumItems
                      .where(
                        (albumItem) =>
                            albumItem.state == ShimmerLogState.published,
                      )
                      .map(
                        (albumItem) => CardTimelineLauncher(albumItem.logs),
                      )
                      .toList(),
                ),
                FlatListSection(
                  title: 'Other',
                  tiles: albumItems
                      .where(
                        (albumItem) =>
                            albumItem.state != ShimmerLogState.published,
                      )
                      .map(
                        (albumItem) => FlatTimelineLauncher(albumItem.logs),
                      )
                      .toList(),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: CreateFloatingActionButton(),
    );
  }
}
