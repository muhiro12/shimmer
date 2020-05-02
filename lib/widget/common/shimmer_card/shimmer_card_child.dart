import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class ShimmerCardChild extends StatelessWidget {
  final Widget body;

  ShimmerCardChild({this.body});

  @override
  Widget build(BuildContext context) {
    return body;
  }

  bool isEmpty() {
    return body == null;
  }

  static ShimmerCardChild instance<T>(
    List<T> list, {
    int start = 0,
    int end,
    bool scrollable = false,
  }) {
    if (list.isEmpty) {
      return ShimmerCardChild();
    }
    List<Widget> children = _createChildren(
      list.sublist(
        min(start, list.length),
        min(end ?? list.length, list.length),
      ),
    );
    if (children.isEmpty) {
      return ShimmerCardChild();
    }
    if (scrollable) {
      return ShimmerCardChild(
        body: ListView(
          shrinkWrap: true,
          children: children,
        ),
      );
    } else {
      return ShimmerCardChild(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      );
    }
  }

  static List<Widget> _createChildren<T>(List<T> list) {
    switch (T) {
      case String:
        final List<String> texts = list as List<String>;
        final newTexts = texts.where((text) => text.isNotEmpty).toList();
        return _texts(newTexts);
      case Uint8List:
        return _images(list as List<Uint8List>);
      default:
        return [];
    }
  }

  static List<Widget> _texts(List<String> texts) {
    return texts
        .map(
          (text) => Text(
            text,
            textAlign: TextAlign.center,
          ),
        )
        .toList();
  }

  static List<Widget> _images(List<Uint8List> images) {
    return images
        .map(
          (image) => Expanded(
            child: Image.memory(image),
          ),
        )
        .toList();
  }
}
