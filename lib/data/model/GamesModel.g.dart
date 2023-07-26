// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GamesModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GamesModelAdapter extends TypeAdapter<GamesModel> {
  @override
  final int typeId = 2;

  @override
  GamesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GamesModel(
      gameId: fields[0] as String?,
      gameCategorieid: fields[1] as String?,
      gameName: fields[2] as String?,
      gameDate: fields[3] as String?,
      gameSize: fields[4] as String?,
      gamePrice: fields[5] as String?,
      gamePeriod: fields[6] as String?,
      gameInternetstate: fields[7] as String?,
      gameGraphics: fields[8] as String?,
      gameImage1: fields[9] as String?,
      gameImage2: fields[10] as String?,
      gameGameplay: fields[11] as String?,
      gameTrailer: fields[12] as String?,
      gameDownloadlink: fields[13] as String?,
      gameRate: fields[14] as String?,
      categoriesId: fields[15] as String?,
      categoriesName: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GamesModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.gameId)
      ..writeByte(1)
      ..write(obj.gameCategorieid)
      ..writeByte(2)
      ..write(obj.gameName)
      ..writeByte(3)
      ..write(obj.gameDate)
      ..writeByte(4)
      ..write(obj.gameSize)
      ..writeByte(5)
      ..write(obj.gamePrice)
      ..writeByte(6)
      ..write(obj.gamePeriod)
      ..writeByte(7)
      ..write(obj.gameInternetstate)
      ..writeByte(8)
      ..write(obj.gameGraphics)
      ..writeByte(9)
      ..write(obj.gameImage1)
      ..writeByte(10)
      ..write(obj.gameImage2)
      ..writeByte(11)
      ..write(obj.gameGameplay)
      ..writeByte(12)
      ..write(obj.gameTrailer)
      ..writeByte(13)
      ..write(obj.gameDownloadlink)
      ..writeByte(14)
      ..write(obj.gameRate)
      ..writeByte(15)
      ..write(obj.categoriesId)
      ..writeByte(16)
      ..write(obj.categoriesName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GamesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
