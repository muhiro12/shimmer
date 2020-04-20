import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/hive/configuration_box.dart';

class SettingsRoot extends StatelessWidget {
  final _box = Hive.box(ConfigurationBox.key.toString());

  @override
  Widget build(BuildContext context) {
    final handwriting =
        _box.get(ConfigurationBox.handWriting.toString(), defaultValue: false);
    final darkMode =
        _box.get(ConfigurationBox.darkMode.toString(), defaultValue: false);
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
                  onChanged: (value) => _box.put(
                    ConfigurationBox.handWriting.toString(),
                    value,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text('DardMode'),
                Switch(
                  value: darkMode,
                  onChanged: (value) => _box.put(
                    ConfigurationBox.darkMode.toString(),
                    value,
                  ),
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

  void _onTap(MaterialColor color) {
    _box.put(ConfigurationBox.primaryColorValue.toString(), color.value);
  }
}
