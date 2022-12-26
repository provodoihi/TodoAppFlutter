import 'package:json_annotation/json_annotation.dart';

import 'forecastData.dart';

part 'weatherData.g.dart';

@JsonSerializable(explicitToJson: true)
class Weather {
  String temperature;
  String wind;
  String description;
  List<Forecast> forecast;

  Weather({
    required this.temperature,
    required this.wind,
    required this.description,
    required this.forecast,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
