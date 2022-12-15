import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PengeluaranTransaksiContainer extends StatelessWidget {
  const PengeluaranTransaksiContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.green,
      child: Column(
        children: [
          Expanded(
              child: ValueListenableBuilder(
                valueListenable: Hive.box("transaksi").listenable(),
                builder: (context, listTransaksi, _){
                  print(listTransaksi.values);
                  return Text("ASU");
                },
              )

          )
        ],
      ),
    );
  }
}
