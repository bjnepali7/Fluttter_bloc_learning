import 'dart:convert';

import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherRespository {
  final WeatherDataProvider weatherDataProvider;
  WeatherRespository(this.weatherDataProvider);
  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'London';
      var weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
