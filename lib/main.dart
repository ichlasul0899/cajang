import 'package:cajang/src/model/transaksi_harian_model.dart';
import 'package:cajang/src/page/add_data.dart';
import 'package:cajang/src/page/home_page.dart';
import 'package:cajang/src/page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransaksiHarianAdapter());
  await Hive.openBox('transaksi');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cajang DEV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/':(context) => const HomePage(),
        '/homeScreen':(context) => const HomeScreen(),
        '/add': (context) => const AddData(),
      },
    );
  }
}
