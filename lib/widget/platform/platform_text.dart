import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/widget/platform/platform_view.dart';

class PlatformText extends PlatformView {
  PlatformText(
    this.text, {
    this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (isCupertino) {
      return Text(
        text,
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              color: color,
            ),
      );
    }
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText1.copyWith(
            color: color,
          ),
    );
  }
}
