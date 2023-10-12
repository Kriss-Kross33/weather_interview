import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_interview/src/features/home/home.dart';
import 'package:weather_interview/src/features/home/presentation/blocs/home_cubit/home_cubit.dart';
import 'package:weather_interview/src/features/home/presentation/blocs/weather_bloc/weather_bloc.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockWeatherBloc extends Mock implements WeatherBloc {}

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

class MockWeather extends Mock implements Weather {}

void main() {
  late WeatherRepository weatherRepository;
  late WeatherBloc weatherBloc;
  late HomeCubit homeCubit;
  late Weather weather;
  const city = 'London';
  group('HomePage', () {
    const bottomNavigationBarKey = Key('__bottom_Nav_bar');

    setUp(() {
      weatherRepository = MockWeatherRepository();
      weather = MockWeather();
      weatherBloc = MockWeatherBloc();
      homeCubit = MockHomeCubit();
      when(() => weatherRepository.getWeather(city))
          .thenAnswer((invocation) async => right(weather));
      when(() => homeCubit.state).thenReturn(const HomeState());
    });

    testWidgets('Renders HomePage', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: weatherRepository,
          child: MaterialApp(
            home: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) =>
                      WeatherBloc(weatherRepository: weatherRepository),
                ),
                BlocProvider(
                  create: (_) => HomeCubit(),
                ),
              ],
              child: const HomePage(),
            ),
          ),
        ),
      );
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('Tapping Cities tab switches to Cities tab', (tester) async {
      when(() => homeCubit.state).thenReturn(const HomeState());
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: weatherRepository,
          child: MaterialApp(
            home: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      WeatherBloc(weatherRepository: weatherRepository),
                ),
                BlocProvider(
                  create: (context) => homeCubit,
                ),
              ],
              child: const HomePage(),
            ),
          ),
        ),
      );
      await tester.tap(find.byKey(bottomNavigationBarKey));
      verify(() => homeCubit.onTabTapped(1)).called(1);
    });

    testWidgets('Tapping Search tab switches to Search tab', (tester) async {
      when(() => homeCubit.state).thenReturn(const HomeState(currentIndex: 1));
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: weatherRepository,
          child: MaterialApp(
            home: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      WeatherBloc(weatherRepository: weatherRepository),
                ),
                BlocProvider(
                  create: (context) => homeCubit,
                ),
              ],
              child: const HomePage(),
            ),
          ),
        ),
      );
      await tester.tap(find.byKey(bottomNavigationBarKey));
      verify(() => homeCubit.onTabTapped(1)).called(1);
    });
  });
}
