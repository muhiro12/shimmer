import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlatListItem extends StatelessWidget {
  FlatListItem(this._child);

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ColoredBox(
          color: Theme.of(context).cardColor,
          child: _child,
        ),
        Divider(),
      ],
    );
  }
}
