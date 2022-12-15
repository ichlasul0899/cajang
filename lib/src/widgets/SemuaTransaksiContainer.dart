import 'package:cajang/src/model/transaksi_harian_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SemuaTransaksiContainer extends StatelessWidget {
  const SemuaTransaksiContainer({Key? key}) : super(key: key);

  static String tipeTransaksi = "Semua";
  static String bulanTransaksi = "12";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.lightBlue.shade50,
      child: ValueListenableBuilder(
        valueListenable: Hive.box("transaksi").listenable(),
        builder: (context, listTransaksi, _){
          print(listTransaksi.length);


          // var filteredUsers = userBox.values.where((user) => user.name.startsWith('s'));
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Pemasukan"),
                            Text("100.000.000"),

                          ],
                        ),
                        Column(
                          children: [
                            Text("Pengeluaran"),
                            Text("50.000.000"),

                          ],
                        ),
                        Column(
                          children: [
                            Text("Balance"),
                            Text("50.000.000"),

                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(child: ListView.builder(
                  itemCount: listTransaksi.length,
                  itemBuilder: (context, index){
                    TransaksiHarian transaksi = listTransaksi.getAt(index);
                    // var filteredTransaction = listTransaksi.values.where((date) => date== "02-12-2022" );
                    // print(filteredTransaction);
                    print(transaksi);

                    return Text("Transaksi ${index} : ${transaksi.date} : ${transaksi.category} - ${transaksi.description} - ${transaksi.harga} - ${transaksi.tipe}");
                  }

              ))

          // itemCount: value.length,
          // itemBuilder: (context , index){
          // TransaksiHarian t = value.getAt(index);
          // return Text(t.description + "asu");
          // });
            ],
          );
        },
      ),
    );
  }
}
