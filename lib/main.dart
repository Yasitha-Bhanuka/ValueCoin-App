import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:valuecoin/models/app_config.dart';
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
  print(_configData);
  GetIt.instance.registerSingleton<AppConfig>(
    AppConfig(
      COIN_API_BASE_URL: _configData['COIN_API_BASE_URL'],
    ),
  );
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
