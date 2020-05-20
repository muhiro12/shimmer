import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/widget/platform/platform_view.dart';

class PlatformSwitch extends PlatformView {
  PlatformSwitch({
    this.value,
    this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    if (isCupertino) {
      return CupertinoSwitch(
        activeColor: Theme.of(context).primaryColor,
        value: value,
        onChanged: onChanged,
      );
    }
    return Switch(
      value: value,
      onChanged: onChanged,
    );
  }
}
