import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  final Widget _child;
  final BottomNavigationBarItem barItem;

  BottomNavigator(this._child, this.barItem);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (_) => MaterialPageRoute(
        builder: (context) => _child,
      ),
    );
  }
}
