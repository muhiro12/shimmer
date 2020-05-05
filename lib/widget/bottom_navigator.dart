import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  BottomNavigator(this._child, this.barItem);

  final Widget _child;
  final BottomNavigationBarItem barItem;

  final GlobalKey<_BottomNavigatorState> key =
      GlobalKey<_BottomNavigatorState>();

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigatorState();
  }
}

class _BottomNavigatorState extends State<BottomNavigator> {
  GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _key,
      onGenerateRoute: (_) => MaterialPageRoute(
        builder: (context) => widget._child,
      ),
    );
  }

  void popToRoot() {
    _key.currentState.popUntil((route) => route.isFirst);
  }
}
