// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenreAdapter extends TypeAdapter<Genre> {
  @override
  final typeId = 1;

  @override
  Genre read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Genre.concert;
      case 1:
        return Genre.movie;
      case 2:
        return Genre.music;
      case 3:
        return Genre.musium;
      case 5:
        return Genre.plane;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, Genre obj) {
    switch (obj) {
      case Genre.concert:
        writer.writeByte(0);
        break;
      case Genre.movie:
        writer.writeByte(1);
        break;
      case Genre.music:
        writer.writeByte(2);
        break;
      case Genre.musium:
        writer.writeByte(3);
        break;
      case Genre.plane:
        writer.writeByte(5);
        break;
    }
  }
}
