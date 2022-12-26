// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weatherData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      temperature: json['temperature'] as String,
      wind: json['wind'] as String,
      description: json['description'] as String,
      forecast: (json['forecast'] as List<dynamic>)
          .map((e) => Forecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'temperature': instance.temperature,
      'wind': instance.wind,
      'description': instance.description,
      'forecast': instance.forecast.map((e) => e.toJson()).toList(),
    };
