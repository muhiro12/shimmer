// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shimmer_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShimmerDataAdapter extends TypeAdapter<ShimmerData> {
  @override
  final typeId = 1;

  @override
  ShimmerData read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShimmerData()
      ..date = fields[0] as DateTime
      ..title = fields[1] as String
      ..summary = fields[2] as String
      ..detail = fields[3] as String
      ..tags = (fields[4] as List)?.cast<String>()
      ..category = fields[5] as ShimmerCategory
      ..artist = fields[6] as String
      ..location = fields[7] as String;
  }

  @override
  void write(BinaryWriter writer, ShimmerData obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.summary)
      ..writeByte(3)
      ..write(obj.detail)
      ..writeByte(4)
      ..write(obj.tags)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.artist)
      ..writeByte(7)
      ..write(obj.location);
  }
}
