import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_size.dart';

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
            SizedBox(
              width: AppSize.spaceM,
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
          elevation: elevation ?? 4,
          child: Container(
            padding: EdgeInsets.all(AppSize.spaceM),
            child: Row(
              children: childrenWithSpace,
            ),
          ),
        ),
      ),
    );
  }
}
