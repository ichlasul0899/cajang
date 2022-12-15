// To parse this JSON data, do
//
//     final transaksiHarian = transaksiHarianFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'transaksi_harian_model.g.dart';

TransaksiHarian transaksiHarianFromJson(String str) => TransaksiHarian.fromJson(json.decode(str));

String transaksiHarianToJson(TransaksiHarian data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class TransaksiHarian {
  TransaksiHarian({
    required this.day,
    required this.date,
    required this.category,
    required this.description,
    required this.harga,
    required this.tipe,
  });

  @HiveField(0)
  String day;
  @HiveField(1)
  String date;
  @HiveField(2)
  String category;
  @HiveField(3)
  String description;
  @HiveField(4)
  String harga;
  @HiveField(5)
  String tipe;

  factory TransaksiHarian.fromJson(Map<String, dynamic> json) => TransaksiHarian(
    day: json["day"],
    date: json["tanggal"],
    category: json["category"],
    description: json["description"],
    harga: json["harga"],
    tipe: json["tipe"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "tanggal": date,
    "category": category,
    "description": description,
    "harga": harga,
    "tipe": tipe,
  };
}
