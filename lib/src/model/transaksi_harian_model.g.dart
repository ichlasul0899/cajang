// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaksi_harian_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransaksiHarianAdapter extends TypeAdapter<TransaksiHarian> {
  @override
  final int typeId = 1;

  @override
  TransaksiHarian read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransaksiHarian(
      day: fields[0] as String,
      date: fields[1] as String,
      category: fields[2] as String,
      description: fields[3] as String,
      harga: fields[4] as String,
      tipe: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransaksiHarian obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.harga)
      ..writeByte(5)
      ..write(obj.tipe);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransaksiHarianAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
