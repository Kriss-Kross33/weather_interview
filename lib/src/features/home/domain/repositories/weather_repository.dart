import 'package:fpdart/fpdart.dart';
import 'package:weather_interview/src/core/errors/errors.dart';
import 'package:weather_interview/src/features/home/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getWeather(String city);
}
