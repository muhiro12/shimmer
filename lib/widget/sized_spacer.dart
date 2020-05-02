import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizedSpacer extends StatelessWidget {
  final double width;
  final double height;

  SizedSpacer({this.width = double.infinity, this.height = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      // TODO: Only for debug
//      color: Colors.red.shade100,
    );
  }
}
