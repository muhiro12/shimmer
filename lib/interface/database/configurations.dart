import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'configurations.g.dart';

@HiveType(typeId: 0)
class Configurations {
  @HiveField(0)
  int primaryColorValue = Colors.blue.value;

  @HiveField(1)
  bool isSystemTheme = true;

  @HiveField(2)
  bool isDarkMode = false;

  @HiveField(3)
  bool isHandWriting = false;
}
