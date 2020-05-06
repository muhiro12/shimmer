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
      category: fields[2] as ShimmerCategory,
      title: fields[4] as String,
      summary: fields[5] as String,
      detail: fields[6] as String,
      star: fields[7] as double,
      tags: (fields[8] as List)?.cast<String>(),
      images: (fields[9] as List)?.cast<Uint8List>(),
      location: fields[10] as String,
      creator: fields[11] as String,
      genre: fields[12] as String,
      theme: fields[13] as String,
      note: fields[14] as String,
    )
      ..key = fields[0] as String
      ..createdDate = fields[1] as DateTime
      ..date = fields[3] as DateTime;
  }

  @override
  void write(BinaryWriter writer, ShimmerLog obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.createdDate)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.summary)
      ..writeByte(6)
      ..write(obj.detail)
      ..writeByte(7)
      ..write(obj.star)
      ..writeByte(8)
      ..write(obj.tags)
      ..writeByte(9)
      ..write(obj.images)
      ..writeByte(10)
      ..write(obj.location)
      ..writeByte(11)
      ..write(obj.creator)
      ..writeByte(12)
      ..write(obj.genre)
      ..writeByte(13)
      ..write(obj.theme)
      ..writeByte(14)
      ..write(obj.note);
  }
}
