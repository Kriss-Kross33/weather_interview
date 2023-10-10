import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  const Weather({
    required this.city,
    required this.countryCode,
    required this.data,
  });
  final String city;
  final String countryCode;
  final List<WeatherData> data;

  static const empty = Weather(
    city: '',
    countryCode: '',
    data: [],
  );

  @override
  List<Object> get props => [
        city,
        countryCode,
        data,
      ];
}

class WeatherData extends Equatable {
  const WeatherData({
    required this.maxTemp,
    required this.minTemp,
    required this.weather,
    required this.datetime,
  });
  final double maxTemp;
  final double minTemp;
  final WeatherInfo weather;
  final DateTime datetime;

  @override
  List<Object> get props => [
        maxTemp,
        minTemp,
        weather,
        datetime,
      ];
}

class WeatherInfo extends Equatable {
  const WeatherInfo({
    required this.description,
    required this.icon,
    required this.code,
  });
  final String description;
  final String icon;
  final int code;

  @override
  List<Object> get props => [
        description,
        icon,
        code,
      ];
}
