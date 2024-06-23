import 'package:weather_app/constants/weather_exports.dart';

class WeatherRepository {
  static Future<Weather> getWeatherInfo() async {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: Constants.baseUrl,
      method: 'GET',
      connectTimeout: Constants.timeOut,
      responseType: ResponseType.json,
    );
    Dio dio = Dio(baseOptions);

    try {
      final response = await dio.request(weatherInfo, queryParameters: {
        'lon': Constants.long,
        'lat': Constants.lat,
        'appid': Constants.apiKey
      });

      return Weather.fromJson(response.data);
    } catch (__) {
      rethrow;
    }
  }

  static Future<List<Weather>> getWeatherForecast() async {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: Constants.baseUrl,
      method: 'GET',
      connectTimeout: Constants.timeOut,
      responseType: ResponseType.json,
    );
    Dio dio = Dio(baseOptions);

    try {
      final response = await dio.request(weatherForeCast, queryParameters: {
        'lon': Constants.long,
        'lat': Constants.lat,
        'appid': Constants.apiKey
      });

      List<Weather> weatherForeCasts = [];
      for (Map<String, dynamic> weatherForeCast in response.data['list']) {
        weatherForeCasts.add(Weather.fromJson(weatherForeCast));
      }

      return weatherForeCasts;
    } catch (__) {
      rethrow;
    }
  }
}
