import 'package:flutter/material.dart';
import 'package:ongkos/app/modules/home/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ongkos Kirim',
      home: HomePage(),
    );
  }
}
