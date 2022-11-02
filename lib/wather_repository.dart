import 'dart:developer';

import 'package:mali_pimpek/api_client.dart';
import 'package:mali_pimpek/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeather();
  Future<void> featchLocationWeather(
      {required String lat, required String long});
}

class WeatherRepositoryImpl implements WeatherRepository {
  final ApiClient _apiClient = ApiClient();

  @override
  Future<Weather> fetchWeather() async {
    log('DOOOING');
    final weather = await _apiClient.getWeather();
    log('Got weather temp: ${weather.main.temp}');
    return weather;
  }

  @override
  Future<void> featchLocationWeather(
      {required String lat, required String long}) async {
    _apiClient.getLocationWeather(lat: lat, long: long);
  }
}

///////
///
abstract class ProfileSettingRepository {
  Future<void> fetchProfileWeather();
}

class ProfileSettingRepositoryImpl implements ProfileSettingRepository {
  final ApiClient _apiClient = ApiClient();

  @override
  Future<void> fetchProfileWeather() async {
    _apiClient.fetchProfileWeather();
  }
}
