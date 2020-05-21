import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/widget/flat_list/flat_list_tile.dart';

class FlatExpansionTile extends FlatListTile {
  FlatExpansionTile({
    this.title,
    this.children,
  });

  final Widget title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
        title: title,
        children: children,
      ),
    );
  }
}
