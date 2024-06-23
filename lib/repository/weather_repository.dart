import 'package:weather_app/constants/weather_exports.dart';

class WeatherRepository {
  static Future<List<Weather>> getWeatherInfo() async {
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

      List<Weather> weatherInfos = [];
      for (Map<String, dynamic> weatherInfo in response.data) {
        weatherInfos.add(Weather.fromJson(weatherInfo));
      }

      return weatherInfos;
    } catch (__) {
      rethrow;
    }
  }
}
