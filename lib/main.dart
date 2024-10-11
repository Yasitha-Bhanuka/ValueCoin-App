import 'package:flutter/material.dart';
import 'package:valuecoin/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ValueCoin',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(88, 60, 197, 1.0),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
