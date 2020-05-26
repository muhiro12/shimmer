import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class ShimmerCardChild extends StatelessWidget {
  ShimmerCardChild._(this._body);

  final Widget _body;

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  static ShimmerCardChild init<T>({
    Widget body,
    List<T> items = const [],
  }) {
    if (body != null) {
      return ShimmerCardChild._(body);
    }
    List<Widget> children = createChildren<T>(items);
    if (children.isEmpty) {
      return null;
    }
    return ShimmerCardChild._(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }

  static List<Widget> createChildren<T>(List<T> items) {
    switch (T) {
      case String:
        final List<String> texts = items as List<String>;
        final notEmptyTexts = texts.where((text) => text.isNotEmpty).toList();
        return notEmptyTexts
            .map(
              (text) => Text(
                text,
                textAlign: TextAlign.center,
              ),
            )
            .toList();
      case Uint8List:
        final List<Uint8List> images = items as List<Uint8List>;
        return images
            .map(
              (image) => Expanded(
                child: Image.memory(image),
              ),
            )
            .toList();
      default:
        return [];
    }
  }
}
