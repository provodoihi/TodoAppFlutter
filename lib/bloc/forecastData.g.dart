// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecastData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      day: json['day'] as String,
      temperature: json['temperature'] as String,
      wind: json['wind'] as String,
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'day': instance.day,
      'temperature': instance.temperature,
      'wind': instance.wind,
    };
