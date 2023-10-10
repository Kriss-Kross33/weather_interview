import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_interview/src/core/core.dart';
import 'package:weather_interview/src/features/feaatures.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late MockApiClient mockApiClient;
  late WeatherRepository weatherRepository;
  const city = 'London';
  setUp(() {
    mockApiClient = MockApiClient();
    weatherRepository = WeatherRepositoryImpl(apiClient: mockApiClient);
  });

  group('WeatherRepository', () {
    final weather = Weather(
      city: 'London',
      countryCode: 'GB',
      data: [
        WeatherData(
          datetime: DateTime.now(),
          minTemp: 15,
          maxTemp: 20,
          weather:
              WeatherInfo(code: 123, description: 'Broken clouds', icon: 'abc'),
        ),
      ],
    );
    test(
        'should return the right side of Either when call to server is successful',
        () async {
      when(() => mockApiClient.fetchWeather(any()))
          .thenAnswer((_) async => weather);
      final result = await weatherRepository.getWeather(city);
      verify(() => mockApiClient.fetchWeather(city));
      expect(result, equals(right(weather)));
    });
    test('should return the left side of either when an error occurs',
        () async {
      when(() => mockApiClient.fetchWeather(any()))
          .thenThrow(ServerException(errorMessage: 'Something went wrong'));
      final result = await weatherRepository.getWeather(city);
      expect(result,
          left(const ServerFailure(errorMessage: 'Something went wrong')));
    });
  });
}
