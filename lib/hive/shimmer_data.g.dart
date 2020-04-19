// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shimmer_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShimmerDataAdapter extends TypeAdapter<ShimmerData> {
  @override
  final typeId = 0;

  @override
  ShimmerData read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShimmerData(
      fields[0] as DateTime,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as Genre,
      (fields[5] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ShimmerData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.artist)
      ..writeByte(3)
      ..write(obj.location)
      ..writeByte(4)
      ..write(obj.genre)
      ..writeByte(5)
      ..write(obj.tags);
  }
}
