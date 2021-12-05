import 'package:flutter_test/flutter_test.dart';
import 'package:test_app_sonali/class15/counter.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);

  });

  test('Year check', () {
    final counter = Counter();

    int year = counter.getYear();

    expect(year, 2021);
  });
}
