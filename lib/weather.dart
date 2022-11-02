/*
 
 {
    "coord": {
      "lon": 10.99,
      "lat": 44.34
    },
    "weather": [
      {
        "id": 501,
        "main": "Rain",
        "description": "moderate rain",
        "icon": "10d"
      }
    ],
    "base": "stations",
    "main": {
      "temp": 298.48,
      "feels_like": 298.74,
      "temp_min": 297.56,
      "temp_max": 300.05,
      "pressure": 1015,
      "humidity": 64,
      "sea_level": 1015,
      "grnd_level": 933
    },
  }
 */

class Weather {
  final MainWeather main;
  final List<WeatherStatus> weather;
  Weather(this.main, this.weather);

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
      MainWeather.fromJson(
        json['main'],
      ),
      (json['weather'] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((element) => WeatherStatus.fromJson(element))
          .toList());
}

class WeatherStatus {
  final int id;

  WeatherStatus(this.id);

  factory WeatherStatus.fromJson(Map<String, dynamic> nestedJson) =>
      WeatherStatus(nestedJson['id']);
}

class MainWeather {
  final double temp;
  MainWeather(this.temp);

  factory MainWeather.fromJson(Map<String, dynamic> nestedJson) =>
      MainWeather(nestedJson['temp']);
}
