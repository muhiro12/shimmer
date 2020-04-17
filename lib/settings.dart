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
    final darkMode = _box.get(HiveKeys.darkMode, defaultValue: false);
    return Column(
      children: <Widget>[
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
    );
  }
}
