import 'package:cajang/src/data/catatan_transaksi.dart';
import 'package:cajang/src/model/transaksi_harian_model.dart';
import 'package:cajang/src/widgets/transaksi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class TransaksiContainer extends StatelessWidget {
  final String title;
  const TransaksiContainer({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
              child: ListView(
                children: catatanTransaksiList.map((e){
                  List detail = e["detail"];
                  return Transaksi(dataTransaksi: e, dataDetailTransaksi: detail,);
                }).toList(),
              )

          )

        ],
      )
    );
  }
}
