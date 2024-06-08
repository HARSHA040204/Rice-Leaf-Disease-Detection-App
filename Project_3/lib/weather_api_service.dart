import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_model.dart';

class WeatherApiService {
  final String apiKey = 'a9f7be8415ba4245819182558241205';
  final String baseUrl = 'http://api.weatherapi.com/v1/forecast.json';

  Future<Weather> fetchWeather(String cityName) async {
    final response = await http.get(Uri.parse('$baseUrl?key=$apiKey&q=$cityName&days=3'));

    if (response.statusCode == 200) {
      return Weather.fromJsonWeatherAPI(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
