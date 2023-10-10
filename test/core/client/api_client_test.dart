import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_interview/src/core/core.dart';

import '../../fixtures/fixture.dart';

class MockClient extends Mock implements Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  late MockClient mockClient;
  late ApiClient apiClient;
  const city = 'London';
  const url =
      'https://api.weatherbit.io/v2.0/forecast/daily?city=$city&key=e33c406c16424c29b8e4f15e7575895f';

  setUpAll(() {
    registerFallbackValue(FakeUri());
  });

  setUp(() {
    mockClient = MockClient();
    apiClient = ApiClient(client: mockClient);
  });

  group('fetchWeather', () {
    final uri = Uri.parse(url);
    test('should make sure get request is made', () async {
      when(() => mockClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => Response(fixture('weather.json'), 200));
      await apiClient.fetchWeather('London');
      verify(() => mockClient.get(uri, headers: {}));
    });
    test('should throw ServerException when status code is not 200', () {
      when(() => mockClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => Response('', 400));
      final result = apiClient.fetchWeather;
      expect(() => result(city), throwsA(isA<ServerException>()));
    });

    test('should throw ServerException when server returns an Exception',
        () async {
      when(() => mockClient.get(any(), headers: any(named: 'headers')))
          .thenThrow(ServerException(errorMessage: 'Something went wrong'));
      final result = apiClient.fetchWeather;
      expect(() => result(city), throwsA(isA<ServerException>()));
    });
  });
}
