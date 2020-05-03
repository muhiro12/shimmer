import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/router/router.dart';
import 'package:shimmer/widget/shimmer_card_child.dart';

class ShimmerCardChildRouter<T> extends Router {
  final Widget body;
  final List<T> items;
  final bool scrollable;

  ShimmerCardChildRouter({
    this.body,
    this.items = const [],
    this.scrollable = false,
  });

  @override
  ShimmerCardChild injected() {
    if (body != null) {
      return createInstance(body);
    }
    List<Widget> children = createChildren();
    if (children.isEmpty) {
      return ShimmerCardChild();
    }
    if (scrollable) {
      return createInstance(
        ListView(
          shrinkWrap: true,
          children: children,
        ),
      );
    } else {
      return createInstance(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      );
    }
  }

  ShimmerCardChild createInstance(Widget body) {
    final isEmpty = body == null;
    return ShimmerCardChild(
      body: body,
      isEmpty: isEmpty,
      isNotEmpty: !isEmpty,
    );
  }

  List<Widget> createChildren() {
    switch (T) {
      case String:
        final List<String> texts = items as List<String>;
        final notEmptyTexts = texts.where((text) => text.isNotEmpty).toList();
        return _texts(notEmptyTexts);
      case Uint8List:
        return _images(items as List<Uint8List>);
      default:
        return [];
    }
  }

  List<Widget> _texts(List<String> texts) {
    return texts
        .map(
          (text) => Text(
            text,
            textAlign: TextAlign.center,
          ),
        )
        .toList();
  }

  List<Widget> _images(List<Uint8List> images) {
    return images
        .map(
          (image) => Expanded(
            child: Image.memory(image),
          ),
        )
        .toList();
  }
}
