import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlatListSection extends StatelessWidget {
  FlatListSection({
    this.title,
    this.tiles,
    this.visible = true,
  });

  final String title;
  final List<Widget> tiles;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Column(
        children: <Widget>[]
          ..addAll(
            [
              ListTile(
                subtitle: title != null ? Text(title) : null,
                dense: true,
              ),
              Divider(),
            ],
          )
          ..addAll(
            ListTile.divideTiles(
              context: context,
              tiles: tiles,
            ),
          )
          ..add(
            Divider(),
          ),
      ),
    );
  }
}
