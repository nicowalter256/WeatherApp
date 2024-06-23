import 'package:json_annotation/json_annotation.dart';
part 'weather.g.dart';

@JsonSerializable()
class Weather {
  Coordinate coord;
  Main main;
  List<Data> weather;
  String base;
  int visibility;
  int timezone;
  int id;
  String name;
  int cod;

  Weather({
    required this.coord,
    required this.base,
    required this.visibility,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
    required this.main,
    required this.weather,
  });
  Map toJson() {
    return _$WeatherToJson(this);
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return _$WeatherFromJson(json);
  }
}

@JsonSerializable()
class Coordinate {
  double lon;
  double lat;

  Coordinate({
    required this.lon,
    required this.lat,
  });
  Map toJson() {
    return _$CoordinateToJson(this);
  }

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return _$CoordinateFromJson(json);
  }
}

@JsonSerializable()
class Data {
  int id;
  String main;
  String description;
  String icon;

  Data({
    required this.main,
    required this.id,
    required this.description,
    required this.icon,
  });
  Map toJson() {
    return _$DataToJson(this);
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
}

@JsonSerializable()
class Main {
  double temp;
  @JsonKey(name: 'feels_like')
  double feelsLike;
  int pressure;
  int humidity;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
  });
  Map toJson() {
    return _$MainToJson(this);
  }

  factory Main.fromJson(Map<String, dynamic> json) {
    return _$MainFromJson(json);
  }
}
