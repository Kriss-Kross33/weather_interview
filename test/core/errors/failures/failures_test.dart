import 'package:flutter_test/flutter_test.dart';
import 'package:weather_interview/src/core/core.dart';

void main() {
  const errorMessage = 'Something went wrong';
  test('Failure props are correct', () {
    expect(
      const Failure(errorMessage: 'Something went wrong').props,
      equals(
        <Object>[
          errorMessage,
        ],
      ),
    );
  });
}
