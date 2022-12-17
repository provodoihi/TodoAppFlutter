class Weather {
  final String temperature;
  final String wind;
  final String description;

  const Weather({
    required this.temperature,
    required this.wind,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['temperature'],
      wind: json['wind'],
      description: json['description'],
    );
  }
}