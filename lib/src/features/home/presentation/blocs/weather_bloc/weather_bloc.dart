import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_interview/src/features/home/domain/domain.dart';
import 'package:weather_interview/src/features/home/domain/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super(const WeatherState()) {
    on<WeatherFetchedEvent>(_onWeatherWeatherFetchedEvent);
  }

  final WeatherRepository _weatherRepository;

  Future<void> _onWeatherWeatherFetchedEvent(
      WeatherFetchedEvent event, Emitter<WeatherState> emit) async {
    if (event.city.isNotEmpty) {
      emit(state.copyWith(status: WeatherStatus.loading));
      final eitherFailureOrWeather =
          await _weatherRepository.getWeather(event.city);
      eitherFailureOrWeather.fold(
        (failure) => emit(
          WeatherState(
            errorMessage: failure.errorMessage,
            status: WeatherStatus.failure,
          ),
        ),
        (weather) => emit(
          state.copyWith(status: WeatherStatus.success, weather: weather),
        ),
      );
    }
  }
}
