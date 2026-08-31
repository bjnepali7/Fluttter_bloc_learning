import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

class WeatherDataProvider {
  Future<String> getCurrentWeather(String cityName) async {
    try {
      const String cityName = 'London';

      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),
      );

      if (res.statusCode == 200) {
        return res.body;
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}