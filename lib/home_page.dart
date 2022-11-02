import 'package:flutter/material.dart';
import 'package:mali_pimpek/wather_repository.dart';
import 'package:mali_pimpek/weather.dart';

class HomePage extends StatelessWidget {
  final WeatherRepository _weatherRepository = WeatherRepositoryImpl();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<Weather>(
            future: _weatherRepository.fetchWeather(),
            builder: (context, snapshot) =>
                Text(snapshot.data?.main.temp.toString() ?? 'Hello'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Get weather'),
          ),
        ],
      ),
    );
  }
}
