part of 'weather_bloc.dart';

enum WeatherStatus { initial, loading, success, failure }

class WeatherState extends Equatable {
  const WeatherState({
    this.status = WeatherStatus.initial,
    Weather? weather,
    this.errorMessage,
  }) : weather = weather ?? Weather.empty;

  final WeatherStatus status;
  final Weather weather;
  final String? errorMessage;

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
    String? errorMessage,
  }) {
    return WeatherState(
        weather: weather ?? this.weather,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [
        status,
        weather,
        errorMessage,
      ];
}
