import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_interview/src/core/core.dart';
import 'package:weather_interview/src/features/home/domain/entities/weather.dart';
import 'package:weather_interview/src/features/home/domain/repositories/weather_repository.dart';
import 'package:weather_interview/src/features/home/presentation/blocs/blocs.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockWeather extends Mock implements Weather {}

void main() {
  late MockWeatherRepository mockWeatherRepository;
  late WeatherBloc weatherBloc;

  const city = 'London';
  const countryCode = 'GB';
  const maxTemp = 20.0;
  const minTemp = 15.0;
  const description = 'Broken clouds';
  const code = 123;
  const icon = 'abc';
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
  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    weatherBloc = WeatherBloc(weatherRepository: mockWeatherRepository);
    when(() => mockWeatherRepository.getWeather(any()))
        .thenAnswer((_) async => right(weather));
  });

  group('WeatherBloc', () {
    test('initial state is WeatherState', () {
      expect(weatherBloc.state, const WeatherState());
    });

    blocTest<WeatherBloc, WeatherState>(
      'does not emit new state when city is empty',
      build: () => weatherBloc,
      act: (bloc) => bloc.add(const WeatherFetchedEvent(city: '')),
      expect: () => <WeatherState>[],
    );

    blocTest<WeatherBloc, WeatherState>(
      'fires WeatherFetchedEvent with city',
      build: () => weatherBloc,
      act: (bloc) => bloc.add(const WeatherFetchedEvent(city: city)),
      verify: ((_) {
        verify(() => mockWeatherRepository.getWeather(city));
      }),
    );

    blocTest<WeatherBloc, WeatherState>(
      'emits [loading, failure] when Failure is returned from the repository',
      build: () => weatherBloc,
      setUp: () {
        when(() => mockWeatherRepository.getWeather(any())).thenAnswer(
          (_) async =>
              left(const ServerFailure(errorMessage: 'Something went wrong')),
        );
      },
      act: (bloc) => bloc.add(const WeatherFetchedEvent(city: city)),
      expect: () => <WeatherState>[
        const WeatherState(status: WeatherStatus.loading),
        const WeatherState(
          status: WeatherStatus.failure,
          errorMessage: 'Something went wrong',
        ),
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'emits [loading, success] when weather is fetched successfully',
      build: () => weatherBloc,
      setUp: () {
        when(() => mockWeatherRepository.getWeather(city))
            .thenAnswer((_) async => right(weather));
      },
      act: (bloc) => weatherBloc.add(const WeatherFetchedEvent(city: city)),
      expect: () => <dynamic>[
        const WeatherState(status: WeatherStatus.loading),
        isA<WeatherState>()
            .having((ws) => ws.status, 'status', WeatherStatus.success)
            .having(
              (ws) => ws.weather,
              'Weather',
              isA<Weather>()
                  .having((w) => w.city, 'city', city)
                  .having((w) => w.countryCode, 'countryCode', countryCode)
                  .having(
                (w) => w.data,
                'data',
                [
                  isA<WeatherData>()
                      .having((wd) => wd.maxTemp, 'maxTemp', maxTemp)
                      .having((wd) => wd.minTemp, 'minTemp', minTemp)
                      .having(
                        (wd) => wd.weather,
                        'weather',
                        isA<WeatherInfo>()
                            .having(
                              (wi) => wi.description,
                              'description',
                              description,
                            )
                            .having((wi) => wi.code, 'code', code)
                            .having((wi) => wi.icon, 'icon', icon),
                      ),
                ],
              ),
            ),
      ],
    );
  });
}
