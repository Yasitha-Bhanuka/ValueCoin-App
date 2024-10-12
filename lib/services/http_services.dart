import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:valuecoin/models/app_config.dart';

class HTTPService {
  final Dio dio = Dio();

  AppConfig? _appConfig;
  String? _base_url;

  HTTPService() {
    _appConfig = GetIt.instance.get<AppConfig>();
    _base_url = _appConfig!.COIN_API_BASE_URL;
    print('Base URL: $_base_url');
  }
}
