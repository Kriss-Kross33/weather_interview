import 'package:flutter_test/flutter_test.dart';
import 'package:weather_interview/src/features/home/presentation/blocs/weather_bloc/weather_bloc.dart';

void main() {
  group('WeatherEvent', () {
    test('WeatherFetchedEvent props are correct', () {
      const city = 'London';
      expect(
        const WeatherFetchedEvent(
          city: city,
        ).props,
        equals(
          <Object?>['London'],
        ),
      );
    });
  });
}
