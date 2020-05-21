import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/widget/flat_list/flat_list_tile.dart';

class FlatListSection extends StatelessWidget {
  FlatListSection({
    this.title,
    this.tiles,
  });

  final String title;
  final List<FlatListTile> tiles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          subtitle: title != null ? Text(title) : null,
          dense: true,
        ),
        Divider(),
        Column(
          children: ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList(),
        ),
        Divider(),
      ],
    );
  }
}
