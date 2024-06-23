import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/repository/weather_repository.dart';

class WeatherController extends ChangeNotifier {
  bool loading = false;
  dynamic exception;
  List<Weather> weatherInfo = [];

  void fetchWeatherInfo() async {
    if (loading == false) {
      loading = true;
      notifyListeners();
    }
    try {
      weatherInfo = [];
      List<Weather> results = await WeatherRepository.getWeatherInfo();
      weatherInfo.addAll(results);
    } catch (e) {
      exception = e;
    }

    loading = false;
    notifyListeners();
  }
}
