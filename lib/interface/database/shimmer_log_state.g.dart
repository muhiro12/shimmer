// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shimmer_log_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShimmerLogStateAdapter extends TypeAdapter<ShimmerLogState> {
  @override
  final typeId = 2;

  @override
  ShimmerLogState read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ShimmerLogState.published;
      case 1:
        return ShimmerLogState.draft;
      case 2:
        return ShimmerLogState.archived;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, ShimmerLogState obj) {
    switch (obj) {
      case ShimmerLogState.published:
        writer.writeByte(0);
        break;
      case ShimmerLogState.draft:
        writer.writeByte(1);
        break;
      case ShimmerLogState.archived:
        writer.writeByte(2);
        break;
    }
  }
}
