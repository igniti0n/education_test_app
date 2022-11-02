// 33a595b1052037a58ebbd6503b0303ac

// / ?lat=34.44&lon=44.44&appid=33a595b1052037a58ebbd6503b0303ac

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mali_pimpek/weather.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://api.openweathermap.org/',
      queryParameters: {
        'lat': 34.44,
        'lon': 44.44,
        'appId': '33a595b1052037a58ebbd6503b0303ac',
      },
    ));
  }

  Future<Weather> getWeather() async {
    final response = await _dio.get('/data/2.5/weather');
    log('Got smth ${response.data}');
    try {
      final weather = Weather.fromJson(response.data);
      log('EVO NEŠTO $weather');
      return weather;
    } catch (err) {
      log('$err');
    }
    return Weather.fromJson({});
  }

  Future<void> getLocationWeather(
      {required String lat, required String long}) async {
    final response = await _dio.get('/data/2.5/weather', queryParameters: {
      'lat': lat,
      'lon': long,
      'appId': '33a595b1052037a58ebbd6503b0303ac',
    });
    log(response.toString());
  }

  Future<void> fetchProfileWeather() async {
    final response = await _dio.get('/data/2.5/weather', queryParameters: {
      'lat': 55,
      'lon': 55,
      'appId': '33a595b1052037a58ebbd6503b0303ac',
    });
    log(response.toString());
  }
}
