import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/widget/platform/platform_view.dart';

class PlatformAlert extends PlatformView {
  PlatformAlert({
    this.title,
    this.content,
    this.actions,
  });

  final Widget title;
  final Widget content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    if (isCupertino) {
      return CupertinoAlertDialog(
        title: title,
        content: content,
        actions: actions,
      );
    }
    return AlertDialog(
      title: title,
      content: content,
      actions: actions,
    );
  }
}
