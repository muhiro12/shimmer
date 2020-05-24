// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configurations.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigurationsAdapter extends TypeAdapter<Configurations> {
  @override
  final typeId = 0;

  @override
  Configurations read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Configurations()
      ..primaryColorValue = fields[0] as int
      ..isSystemTheme = fields[1] as bool
      ..isDarkMode = fields[2] as bool
      ..isHandWriting = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, Configurations obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.primaryColorValue)
      ..writeByte(1)
      ..write(obj.isSystemTheme)
      ..writeByte(2)
      ..write(obj.isDarkMode)
      ..writeByte(3)
      ..write(obj.isHandWriting);
  }
}
