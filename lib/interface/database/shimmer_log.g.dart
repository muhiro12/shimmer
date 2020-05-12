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
      state: fields[3] as ShimmerLogState,
      category: fields[10] as ShimmerCategory,
      title: fields[12] as String,
      summary: fields[13] as String,
      detail: fields[14] as String,
      star: fields[15] as double,
      tags: (fields[16] as List)?.cast<String>(),
      images: (fields[17] as List)?.cast<Uint8List>(),
      location: fields[18] as String,
      creator: fields[19] as String,
      genre: fields[20] as String,
      theme: fields[21] as String,
      note: fields[22] as String,
    )
      ..updatedAt = fields[2] as DateTime
      ..date = fields[11] as DateTime;
  }

  @override
  void write(BinaryWriter writer, ShimmerLog obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.createdDate)
      ..writeByte(2)
      ..write(obj.updatedAt)
      ..writeByte(3)
      ..write(obj.state)
      ..writeByte(10)
      ..write(obj.category)
      ..writeByte(11)
      ..write(obj.date)
      ..writeByte(12)
      ..write(obj.title)
      ..writeByte(13)
      ..write(obj.summary)
      ..writeByte(14)
      ..write(obj.detail)
      ..writeByte(15)
      ..write(obj.star)
      ..writeByte(16)
      ..write(obj.tags)
      ..writeByte(17)
      ..write(obj.images)
      ..writeByte(18)
      ..write(obj.location)
      ..writeByte(19)
      ..write(obj.creator)
      ..writeByte(20)
      ..write(obj.genre)
      ..writeByte(21)
      ..write(obj.theme)
      ..writeByte(22)
      ..write(obj.note);
  }
}
