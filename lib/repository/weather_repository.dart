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
    } catch (e,s) {
      print("akkakakaakka: $e");
      print("akkakakaakka: $s");
      rethrow;
    }
  }
}
