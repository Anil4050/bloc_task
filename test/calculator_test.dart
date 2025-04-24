// test/calculator_test.dart
//Unit test
import 'package:api_calling/Utils/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Calculator calculator;

  setUp(() {
    calculator = Calculator();
  });

  test('adds two numbers correctly', () {
    expect(calculator.add(2, 3), 5);
  });

  test('subtracts two numbers correctly', () {
    expect(calculator.subtract(5, 3), 2);
  });

  test('multiplies two numbers correctly', () {
    expect(calculator.multiply(2, 3), 6);
  });

  test('divides two numbers correctly', () {
    expect(calculator.divide(6, 2), 3);
  });

  test('throws error when dividing by zero', () {
    expect(() => calculator.divide(5, 0), throwsA(isA<ArgumentError>()));
  });
}
