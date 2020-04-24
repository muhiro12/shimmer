import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_size.dart';

class ShimmerCard extends StatelessWidget {
  final Widget child;
  final double elevation;
  final Function onTap;

  ShimmerCard({this.child, this.elevation, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: elevation ?? 12,
          child: Container(
            padding: EdgeInsets.all(AppSize.spaceM),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
