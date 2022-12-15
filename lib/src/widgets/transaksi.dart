import 'package:cajang/src/widgets/detail_transaksi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Transaksi extends StatelessWidget {
  final Map<String, dynamic> dataTransaksi;
  final List dataDetailTransaksi;

  const Transaksi({Key? key, required this.dataTransaksi, required this.dataDetailTransaksi}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.lightGreen.shade100,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.lightBlue.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 60,
                      child: Text(dataTransaksi['date'], style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${dataTransaksi['month']} - ${dataTransaksi['year']}", style: TextStyle(fontWeight: FontWeight.bold),),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            margin: EdgeInsets.only(top: 5),
                            color: Colors.white,
                            // decoration: const BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: BorderRadius.all(Radius.circular(25),
                            //
                            //   )
                            // ),
                            child: Text(dataTransaksi['day'])),
                      ],
                    ),
                  ],
                ),
                const Text("Rp. 100.000")
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.lightBlue.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 100,
                            child: Text("Category")),
                        Text("Description"),

                      ],
                    ),
                  ],
                ),
                Text("Harga"),

              ],
            ),
          ),
          Column(
            children: dataDetailTransaksi.map((e) => DetailTransaksi(dataDetail: e)).toList(),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //
          //     Column(
          //       children: [
          //         Row(
          //           children: [
          //             Text("Makanan"),
          //             Text("Beli Makanan")
          //           ],
          //         ),
          //       ],
          //     ),
          //     Text("Rp. 20.000")
          //   ],
          // )
        ],
      ),
    );
  }
}
