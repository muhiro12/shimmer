import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/hive/keys.dart';

class Settings extends StatelessWidget {
  final _box = Hive.box(HiveKeys.configurationBox);

  void _onTap(MaterialColor color) {
    _box.put(HiveKeys.primaryColor, color.value);
  }

  @override
  Widget build(BuildContext context) {
    final handwriting = _box.get(HiveKeys.handwriting, defaultValue: false);
    final darkMode = _box.get(HiveKeys.darkMode, defaultValue: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          CloseButton(),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Handwriting'),
                Switch(
                  value: handwriting,
                  onChanged: (value) => _box.put(HiveKeys.handwriting, value),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text('DardMode'),
                Switch(
                  value: darkMode,
                  onChanged: (value) => _box.put(HiveKeys.darkMode, value),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: Colors.primaries
                    .map(
                      (color) => GestureDetector(
                        child: Card(
                          color: color,
                          child: Container(
                            height: 150,
                          ),
                        ),
                        onTap: () => _onTap(color),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
