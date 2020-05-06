// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shimmer_log.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShimmerLogAdapter extends TypeAdapter<ShimmerLog> {
  @override
  final typeId = 0;

  @override
  ShimmerLog read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShimmerLog(
      createdDate: fields[0] as DateTime,
      category: fields[1] as ShimmerCategory,
      date: fields[2] as DateTime,
      title: fields[3] as String,
      summary: fields[4] as String,
      detail: fields[5] as String,
      star: fields[6] as double,
      tags: (fields[7] as List)?.cast<String>(),
      images: (fields[8] as List)?.cast<Uint8List>(),
      location: fields[9] as String,
      creator: fields[10] as String,
      genre: fields[11] as String,
      theme: fields[12] as String,
      note: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ShimmerLog obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.createdDate)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.summary)
      ..writeByte(5)
      ..write(obj.detail)
      ..writeByte(6)
      ..write(obj.star)
      ..writeByte(7)
      ..write(obj.tags)
      ..writeByte(8)
      ..write(obj.images)
      ..writeByte(9)
      ..write(obj.location)
      ..writeByte(10)
      ..write(obj.creator)
      ..writeByte(11)
      ..write(obj.genre)
      ..writeByte(12)
      ..write(obj.theme)
      ..writeByte(13)
      ..write(obj.note);
  }
}
