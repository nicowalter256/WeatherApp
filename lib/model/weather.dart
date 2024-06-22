import 'package:json_annotation/json_annotation.dart';
part 'weather.g.dart';

@JsonSerializable()
class Weather {
  Coordinate coord;
  String base;
  BigInt visibility;
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
