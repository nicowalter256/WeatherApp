import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/repository/weather_repository.dart';

class WeatherController extends ChangeNotifier {
  bool loading = false;
  dynamic exception;
  Weather? weather;

  List<Weather> weatherForeCasts = [];

  void fetchWeatherForeCasts() async {
    if (loading == false) {
      loading = true;
      notifyListeners();
    }
    try {
      weatherForeCasts = [];
      List<Weather> results = await WeatherRepository.getWeatherForecast();
      weatherForeCasts.addAll(results);
    } catch (e) {
      exception = e;
    }

    loading = false;
    notifyListeners();
  }

  void fetchWeatherInfo() async {
    if (loading == false) {
      loading = true;
      notifyListeners();
    }
    try {
      List<dynamic> results = await Future.wait([
        WeatherRepository.getWeatherInfo(),
      ], eagerError: true);
      weather = results[0];
    } catch (e) {
      exception = e;
    }

    loading = false;
    notifyListeners();
  }
}
