part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherFetchedEvent extends WeatherEvent {
  const WeatherFetchedEvent({required this.city});
  final String city;

  @override
  List<Object> get props => [city];
}
