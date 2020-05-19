import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/widget/sized_spacer.dart';

class ShimmerCard extends StatelessWidget {
  ShimmerCard._({
    this.children,
    this.elevation,
    this.onTap,
  });

  final List<Widget> children;
  final double elevation;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: elevation,
          child: Container(
            padding: EdgeInsets.all(AppParameter.spaceM),
            child: Row(
              children: children,
            ),
          ),
        ),
      ),
    );
  }

  static ShimmerCard init({
    List<Widget> children,
    double elevation,
    Function onTap,
  }) {
    if (children == null) {
      return null;
    }
    final filtered = children.where((child) => child != null).toList();
    if (filtered.isEmpty) {
      return null;
    }
    final List<Widget> childrenWithSpace = [];
    filtered.asMap().forEach(
      (index, child) {
        if (index > 0) {
          childrenWithSpace.add(
            SizedSpacer(
              width: AppParameter.spaceM,
            ),
          );
        }
        childrenWithSpace.add(
          Expanded(
            child: child,
          ),
        );
      },
    );
    return ShimmerCard._(
      children: childrenWithSpace,
      elevation: elevation,
      onTap: onTap,
    );
  }
}
