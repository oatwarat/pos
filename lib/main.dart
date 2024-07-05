import 'package:flutter/material.dart';
import 'package:pos/src/modules/pos/pos_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TCC POS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PosView(),
    );
  }
}
