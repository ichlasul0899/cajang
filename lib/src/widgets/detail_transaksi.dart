import 'package:flutter/material.dart';

class DetailTransaksi extends StatelessWidget {
  final Map<String,dynamic> dataDetail;
  const DetailTransaksi({Key? key, required this.dataDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                      child: Text(dataDetail["category"])),
                  Text(dataDetail["description"]),
                ],
              ),
            ],
          ),

          Text(dataDetail["harga"]),

        ],
      ),
    );
  }
}
