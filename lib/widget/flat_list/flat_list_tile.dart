import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlatListTile extends StatelessWidget {
  FlatListTile({
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  final Widget title;
  final Widget subtitle;
  final Widget trailing;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).cardColor,
      child: ListTile(
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
