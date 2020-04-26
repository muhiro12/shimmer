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
    return ShimmerData()
      ..createdDate = fields[0] as DateTime
      ..category = fields[1] as ShimmerCategory
      ..date = fields[2] as DateTime
      ..title = fields[3] as String
      ..summary = fields[4] as String
      ..detail = fields[5] as String
      ..note = fields[6] as String
      ..theme = fields[7] as String
      ..images = (fields[8] as List)?.cast<File>()
      ..tags = (fields[9] as List)?.cast<String>()
      ..star = fields[10] as int
      ..creator = fields[11] as String
      ..location = fields[12] as String
      ..genre = fields[13] as String
      ..option1 = fields[14] as String
      ..option2 = fields[15] as String
      ..option3 = fields[16] as String;
  }

  @override
  void write(BinaryWriter writer, ShimmerData obj) {
    writer
      ..writeByte(17)
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
      ..write(obj.note)
      ..writeByte(7)
      ..write(obj.theme)
      ..writeByte(8)
      ..write(obj.images)
      ..writeByte(9)
      ..write(obj.tags)
      ..writeByte(10)
      ..write(obj.star)
      ..writeByte(11)
      ..write(obj.creator)
      ..writeByte(12)
      ..write(obj.location)
      ..writeByte(13)
      ..write(obj.genre)
      ..writeByte(14)
      ..write(obj.option1)
      ..writeByte(15)
      ..write(obj.option2)
      ..writeByte(16)
      ..write(obj.option3);
  }
}
