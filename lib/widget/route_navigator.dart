import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteNavigator {
  static void push({BuildContext context, Widget widget}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
