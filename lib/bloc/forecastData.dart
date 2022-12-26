import 'package:json_annotation/json_annotation.dart';

part 'forecastData.g.dart';

@JsonSerializable()
class Forecast {
  String day;
  String temperature;
  String wind;

  Forecast({
    required this.day,
    required this.temperature,
    required this.wind,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
