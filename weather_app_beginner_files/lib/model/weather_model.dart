// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// class WeatherModel {

//   /**
//           final data = snapshot.data!;

//           final currentWeatherData = data['list'][0];

// final currentTemp = currentWeatherData['main']['temp'];
// final currentSky = currentWeatherData['weather'][0]['main'];
// final currentPressure = currentWeatherData['main']['pressure'];
// final currentWindSpeed = currentWeatherData['wind']['speed'];
// final currentHumidity = currentWeatherData['main']['humidity']; */
// }
class WeatherModel {
  final double temperature;
  final String sky;
  final int pressure;
  final double windSpeed;
  final int humidity;
  WeatherModel({
    required this.temperature,
    required this.sky,
    required this.pressure,
    required this.windSpeed,
    required this.humidity,
  });

  WeatherModel copyWith({
    double? temperature,
    String? sky,
    int? pressure,
    double? windSpeed,
    int? humidity,
  }) {
    return WeatherModel(
      temperature: temperature ?? this.temperature,
      sky: sky ?? this.sky,
      pressure: pressure ?? this.pressure,
      windSpeed: windSpeed ?? this.windSpeed,
      humidity: humidity ?? this.humidity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temperature': temperature,
      'sky': sky,
      'pressure': pressure,
      'windSpeed': windSpeed,
      'humidity': humidity,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map['list'][0];
    //  final currentTemp = currentWeatherData['main']['temp'];
    //     final currentSky = currentWeatherData['weather'][0]['main'];
    //     final currentPressure = currentWeatherData['main']['pressure'];
    //     final currentWindSpeed = currentWeatherData['wind']['speed'];
    //     final currentHumidity = currentWeatherData['main']['humidity'];

    return WeatherModel(
      temperature: currentWeatherData['main']['temp'],
      sky: currentWeatherData['weather'][0]['main'],
      pressure: currentWeatherData['main']['pressure'],
      windSpeed: currentWeatherData['wind']['speed'],
      humidity: currentWeatherData['main']['humidity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(temperature: $temperature, sky: $sky, pressure: $pressure, windSpeed: $windSpeed, humidity: $humidity)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return other.temperature == temperature &&
        other.sky == sky &&
        other.pressure == pressure &&
        other.windSpeed == windSpeed &&
        other.humidity == humidity;
  }

  @override
  int get hashCode {
    return temperature.hashCode ^
        sky.hashCode ^
        pressure.hashCode ^
        windSpeed.hashCode ^
        humidity.hashCode;
  }
}
