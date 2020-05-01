import 'package:flutter/cupertino.dart';

class ShimmerCardColumn extends StatelessWidget {
  final List<Widget> children;

  ShimmerCardColumn({this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
