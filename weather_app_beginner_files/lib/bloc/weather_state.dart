part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class Weathersucess extends WeatherState {
  final WeatherModel weatherModel;

  Weathersucess({required this.weatherModel});

}

final class WeatherError extends WeatherState {
  final String error;

  WeatherError(this.error);
}

final class WeatherLoading extends WeatherState {}
