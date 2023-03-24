import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ongkos/app/modules/home/view.dart';
import 'package:ongkos/app/modules/resi/view.dart';
import 'package:ongkos/app/modules/setting/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/resi', page: () => const CekResi()),
        GetPage(name: '/setting', page: () => const Setting()),
      ],
      title: 'Ongkos Kirim',
      home: HomePage(),
    );
  }
}
