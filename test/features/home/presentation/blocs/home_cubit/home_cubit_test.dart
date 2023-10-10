import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_interview/src/features/home/presentation/blocs/home_cubit/home_cubit.dart';

void main() {
  late HomeCubit homeCubit;
  const cityIndex = 1;
  const searchIndex = 0;

  setUp(() {
    homeCubit = HomeCubit();
  });
  group('HomeCubit', () {
    blocTest(
      'emits state with currentIndex changed to Cities Index [1] from search index [0]',
      build: () => homeCubit,
      seed: () => const HomeState(currentIndex: searchIndex),
      act: (cubit) => cubit.onTabTapped(cityIndex),
      expect: () => <HomeState>[const HomeState(currentIndex: cityIndex)],
    );

    blocTest(
        'emits state with currentIndex changed to search index [1] from city index [0]',
        build: () => homeCubit,
        seed: () => const HomeState(currentIndex: cityIndex),
        act: (cubit) => cubit.onTabTapped(searchIndex),
        expect: () => <HomeState>[const HomeState(currentIndex: searchIndex)]);
  });
}
