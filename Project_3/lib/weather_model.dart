class Weather {
  final String cityName;
  final double temperature;
  final String description;
  final double humidity;
  final double windSpeed;
  final double minTemp;
  final double maxTemp;
  final double airQuality;
  final List<dynamic> forecast; // List to hold forecast data

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.minTemp,
    required this.maxTemp,
    required this.airQuality,
    required this.forecast,
  });

  factory Weather.fromJsonWeatherAPI(Map<String, dynamic> json) {
    var location = json['location'];
    var current = json['current'];
    var forecast = json['forecast']['forecastday'];

    return Weather(
      cityName: location['name'],
      temperature: current['temp_c'].toDouble(),
      description: current['condition']['text'],
      humidity: current['humidity'].toDouble(),
      windSpeed: current['wind_kph'].toDouble(),
      minTemp: forecast[0]['day']['mintemp_c'].toDouble(),
      maxTemp: forecast[0]['day']['maxtemp_c'].toDouble(),
      airQuality: 0.0, // As the AQI is disabled in the URL provided
      forecast: forecast, // Assigning forecast data
    );
  }
}
