import 'package:cajang/src/model/transaksi_harian_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  static String routeName = "/add";


  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  TextEditingController controller = TextEditingController();
  TextEditingController controllerJumlah = TextEditingController();
  TextEditingController controllerKeterangan = TextEditingController();

  List<String> category_list = [
    "Makanan",
    "Sewa Kosan",
    "Internet",
    "Transportasi",
    "Tagihan",
    "Lain lain",
  ];

  String dropdownValue = "Makanan";
  String day = "";




  @override
  Widget build(BuildContext context) {
    // var box = Hive.box('myBox');


    return Scaffold(
      appBar: AppBar(
        title: Text("Catat Transaksi"),
      ),
      body: ListView(

        children: [
          // Text(controller.text),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const Gap(20),

                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(20)),
                //     color: Colors.lightBlue.shade50,
                //   ),
                //   child: Row(
                //
                //     children: [
                //       ElevatedButton(
                //           onPressed: (){},
                //           child: Text("Pemasukan"),
                //           style: ButtonStyle(
                //             backgroundColor: MaterialStateProperty.all(Colors.lightBlue.shade50),
                //           ),
                //       ),
                //       ElevatedButton(onPressed: (){}, child: Text("Pengeluaran")),
                //     ],
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   ),
                // ),

                TextField(
                  controller: controller,
                  readOnly: true,
                  onTap: () async {
                    DateTime?pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));

                    if(pickedDate!=null){
                      print(pickedDate);
                      String formattedDate = DateFormat("dd-MM-yyyy").format(pickedDate);
                      print(formattedDate);


                      setState(() {
                        controller.text = formattedDate.toString();
                        day = DateFormat('EEEE').format(pickedDate);
                      });
                    } else {
                      print("no date");
                    }

                  },
                  decoration: InputDecoration(

                    // icon: Icon(Icons.person),
                    fillColor: Colors.lightBlue.shade50,
                    filled: true,
                    prefixIcon: Icon(Icons.date_range),
                    // prefixText: "Name  ",
                    // prefix: Text("Hello"),
                    // suffix: Text("Nama"),
                    hintText: 'Tanggal',
                    // hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    // labelText: 'Category(IN/OUT)',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10)))

                  ),
                ),
                const Gap(20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.lightBlue.shade50
                  ),
                  child: DropdownButton(
                      dropdownColor: Colors.blue.shade50,
                      underline: Container(),
                      value: dropdownValue,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      isExpanded: true,
                      iconSize: 26.0,
                      iconEnabledColor: Colors.blue,
                      // value: selected,
                      
                      items: category_list.map((e) =>
                          DropdownMenuItem(
                            value: e,
                            child: Text(e),
                      )).toList(),
                      // value: _dropdownValue,
                      onChanged: (String? value){
                        setState(() {
                          dropdownValue = value!;
                        });
                      }
                  ),
                ),
                const Gap(20),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: controllerJumlah,
                  onTap: () {


                  },
                  decoration: InputDecoration(

                    // icon: Icon(Icons.person),
                      fillColor: Colors.lightBlue.shade50,
                      filled: true,
                      prefixIcon: Icon(Icons.monetization_on_outlined),
                      hintText: 'Jumlah',
                      // hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)))

                  ),
                ),
                const Gap(20),
                TextField(
                  controller: controllerKeterangan,
                  onTap: () {


                  },
                  decoration: InputDecoration(
                      fillColor: Colors.lightBlue.shade50,
                      filled: true,
                      prefixIcon: Icon(Icons.notes_outlined),
                      hintText: 'Keterangan',
                      // hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)))

                  ),
                ),

              ],
            ),
          ),
          Gap(20),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
              ),
                onPressed: () async {

                  var transaksi = await Hive.openBox('transaksi');

                  var new_transaksi = TransaksiHarian(day: day, date: controller.text, category: dropdownValue, description: controllerKeterangan.text, harga: controllerJumlah.text, tipe: "uang masuk");
                  transaksi.add(new_transaksi);








                  // print("add data to db" + transaksi.);
                  // var box = Hive.box('myBox');

                  // box.put('name', 'Paul');
                  // String name = box.get('name');
                  // print(name);


                  // print("Day : ${day}");
                  // print("Date : ${controller.text}");
                  // print("Category : ${dropdownValue}");
                  // print("Price : ${controllerJumlah.text}");
                  // print("Description : ${controllerKeterangan.text}");

                  // box.put(controller.text, {
                  //   "category": dropdownValue,
                  //   "price": controllerJumlah.text,
                  //   "description": controllerKeterangan.text
                  // });
                  //
                  // print(box.get(controller.text));


                  // Bersihkan Form
                  // Navigator.pop(context);
                },
                child: Text("Simpan")
            ),

          ),




        ],
      ),
    );
  }
}
