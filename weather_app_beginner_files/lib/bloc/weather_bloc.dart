import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/repository/weather_respository.dart';
import 'package:weather_app/model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRespository weatherRespository;
  WeatherBloc(this.weatherRespository) : super(WeatherInitial()) {
    on<WeatherFetched>(_getCurrentWeather);
  }
  Future<void> _getCurrentWeather(
      WeatherFetched event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRespository.getCurrentWeather();
      emit(WeatherSuccess(weatherModel: weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
