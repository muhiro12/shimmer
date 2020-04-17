import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('You have clicked the button this many times:'),
          Text(
            'Settings',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
