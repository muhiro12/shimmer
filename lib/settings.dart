import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/hive/keys.dart';

class Settings extends StatelessWidget {
  void _onTap(MaterialColor color) {
    Hive.box(HiveKeys.box).put(HiveKeys.primaryColor, color.value);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
