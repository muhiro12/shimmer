// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shimmer_data_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShimmerDataListAdapter extends TypeAdapter<ShimmerDataList> {
  @override
  final typeId = 2;

  @override
  ShimmerDataList read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShimmerDataList()..value = (fields[0] as List)?.cast<ShimmerData>();
  }

  @override
  void write(BinaryWriter writer, ShimmerDataList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }
}
