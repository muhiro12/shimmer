import 'package:flutter/cupertino.dart';

class ShimmerCardChild extends StatelessWidget {
  final Widget body;
  final bool isEmpty;
  final bool isNotEmpty;

  ShimmerCardChild({
    this.body,
    this.isEmpty = true,
    this.isNotEmpty = false,
  });

  @override
  Widget build(BuildContext context) {
    return body;
  }
}
