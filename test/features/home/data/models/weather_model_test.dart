import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_interview/src/features/home/home.dart';

import '../../../../fixtures/fixture.dart';

void main() {
  final weather = WeatherModel(
    city: 'London',
    countryCode: 'GB',
    data: [
      WeatherDataModel(
        datetime: DateTime.parse('2023-10-09'),
        minTemp: 14.1,
        maxTemp: 23.5,
        weather: const WeatherInfoModel(
          code: 802,
          description: 'Scattered clouds',
          icon: 'c02d',
        ),
      ),
    ],
  );

  test('should subclass Weather', () {
    expect(weather, equals(isA<Weather>()));
  });

  group('fromJson', () {
    test('should return a valid weather model', () {
      final jsonMap =
          jsonDecode(fixture('weather.json')) as Map<String, dynamic>;
      final result = WeatherModel.fromJson(jsonMap);
      expect(result, equals(weather));
    });
  });
}
