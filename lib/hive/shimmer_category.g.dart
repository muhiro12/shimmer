// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shimmer_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShimmerCategoryAdapter extends TypeAdapter<ShimmerCategory> {
  @override
  final typeId = 1;

  @override
  ShimmerCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ShimmerCategory.plain;
      case 1:
        return ShimmerCategory.concert;
      case 2:
        return ShimmerCategory.movie;
      case 3:
        return ShimmerCategory.book;
      case 4:
        return ShimmerCategory.cafe;
      case 5:
        return ShimmerCategory.museum;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, ShimmerCategory obj) {
    switch (obj) {
      case ShimmerCategory.plain:
        writer.writeByte(0);
        break;
      case ShimmerCategory.concert:
        writer.writeByte(1);
        break;
      case ShimmerCategory.movie:
        writer.writeByte(2);
        break;
      case ShimmerCategory.book:
        writer.writeByte(3);
        break;
      case ShimmerCategory.cafe:
        writer.writeByte(4);
        break;
      case ShimmerCategory.museum:
        writer.writeByte(5);
        break;
    }
  }
}
