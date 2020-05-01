import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/widget/common/sized_spacer.dart';

class ShimmerCard extends StatelessWidget {
  final List<Widget> children;
  final double elevation;
  final Function onTap;

  ShimmerCard({this.children, this.elevation, this.onTap});

  @override
  Widget build(BuildContext context) {
    final List<Widget> childrenWithSpace = [];
    children.asMap().forEach(
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
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: elevation ?? AppParameter.elevation,
          child: Container(
            padding: EdgeInsets.all(AppParameter.spaceM),
            child: Row(
              children: childrenWithSpace,
            ),
          ),
        ),
      ),
    );
  }
}
