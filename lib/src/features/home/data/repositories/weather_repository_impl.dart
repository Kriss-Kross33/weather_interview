import 'package:fpdart/fpdart.dart';
import 'package:weather_interview/src/core/core.dart';
import 'package:weather_interview/src/features/home/domain/entities/weather.dart';
import 'package:weather_interview/src/features/home/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl({required ApiClient apiClient})
      : _apiClient = apiClient;
  final ApiClient _apiClient;

  @override
  Future<Either<Failure, Weather>> getWeather(String city) async {
    try {
      final remoteData = await _apiClient.fetchWeather(city);
      return right(remoteData);
    } on ServerException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    }
  }
}
