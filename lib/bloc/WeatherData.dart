import 'package:json_annotation/json_annotation.dart';

class Weather {
  final String temperature;
  final String wind;
  final String description;
  final List<Forecast> forecast;

  const Weather({
    required this.temperature,
    required this.wind,
    required this.description,
    required this.forecast,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    var list = json['forecast'] as List;
    List<Forecast> forecastList = list.map((e) => Forecast.fromJson(e)).toList();
    return Weather(
      temperature: json['temperature'],
      wind: json['wind'],
      description: json['description'],
      forecast: forecastList,
    );
  }
}

class Forecast {
  final String day;
  final String temperature;
  final String wind;

  const Forecast({
    required this.day,
    required this.temperature,
    required this.wind,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
        day: json['day'], temperature: json['temperature'], wind: json['wind']);
  }
}
