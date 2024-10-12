import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valuecoin/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  runApp(const MyApp());
}

Future<void> loadConfig() async {
  String _configContent =
      await rootBundle.loadString('assets/config/main.json');

  Map _configData = jsonDecode(_configContent);
  // print(_configContent);
  print(_configData);
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
