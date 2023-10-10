import 'package:flutter_test/flutter_test.dart';
import 'package:weather_interview/src/features/home/presentation/blocs/blocs.dart';

void main() {
  const index = 0;
  const homeState = HomeState();
  group('HomeState', () {
    HomeState createState({int? currentIndex}) {
      return HomeState(currentIndex: currentIndex ?? index);
    }

    test('initial state has currentIndex set as 0', () {
      expect(homeState.currentIndex, 0);
    });
    test('HomeState props are correct', () {
      expect(
        const HomeState(
          currentIndex: 0,
        ).props,
        equals(<Object>[index]),
      );
    });

    group('copyWith', () {
      test('return the same state object when no arguments are provided', () {
        expect(createState().copyWith(), createState());
      });
    });
  });
}
