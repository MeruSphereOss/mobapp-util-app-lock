import 'package:flutter_test/flutter_test.dart';

import 'package:mobapp_util_app_lock/mobapp_util_app_lock.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });
}
