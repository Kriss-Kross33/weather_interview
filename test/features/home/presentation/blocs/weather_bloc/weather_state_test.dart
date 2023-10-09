import 'package:flutter_test/flutter_test.dart';
import 'package:weather_interview/src/features/home/domain/domain.dart';
import 'package:weather_interview/src/features/home/presentation/blocs/weather_bloc/weather_bloc.dart';

void main() {
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

  group('WeatherState', () {
    WeatherState createWeather({
      WeatherStatus? status,
      Weather? weather,
      String? errorMessage,
    }) {
      return WeatherState(
        weather: weather ?? weather,
        status: status ?? WeatherStatus.initial,
        errorMessage: errorMessage,
      );
    }

    test('returns WeatherStatus.initial', () {
      const weatherState = WeatherState();
      expect(weatherState.status, WeatherStatus.initial);
    });
    group('copyWith', () {
      test('returns same state object when no arguments are provided', () {
        expect(createWeather().copyWith(), createWeather());
      });
    });

    test('props are correct', () {
      expect(
          WeatherState(
            weather: weather,
            status: WeatherStatus.initial,
            errorMessage: null,
          ).props,
          equals(<Object?>[
            WeatherStatus.initial,
            weather,
            null,
          ]));
    });
  });
}
