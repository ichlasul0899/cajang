import 'package:cajang/src/page/add_data.dart';
import 'package:cajang/src/widgets/SemuaTransaksiContainer.dart';
import 'package:cajang/src/widgets/pengeluaran_transaksi_container.dart';
import 'package:cajang/src/widgets/transaksi_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Cajang Finance"),
            bottom: const TabBar(
              tabs: [
                Tab(text: "Pemasukan",),
                Tab(text: "Pengeluaran",),
                Tab(text: "Semua",),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              TransaksiContainer(title: "Pemasukan"),
              PengeluaranTransaksiContainer(),
              SemuaTransaksiContainer(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.pushNamed(context, AddData.routeName);
            },
            tooltip: 'Create',
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: BottomAppBar(

            color: Colors.blue,
            shape: const CircularNotchedRectangle(),
            child: IconTheme(
              data: IconThemeData(color: Colors.blue),
              child: Row(
                children: <Widget>[
                  IconButton(
                    tooltip: 'Open navigation menu',
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

        )
    );
  }
}
