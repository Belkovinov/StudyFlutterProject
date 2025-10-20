import 'package:flutter_project/domain/use_cases/calc_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group ("", () {
    test("", () {
      final calculator = CalcUseCase(onStartLoading: () {}, onEndLoading: () {});

      final result = calculator.add(2, 2);

      expect(result, 4);
    });

    test("", () {
      final calculator = CalcUseCase(
        onStartLoading: () {},
        onEndLoading: () {},
      );

      final result = calculator.substract(2, 2);

      expect(result, 0);
    });
  });
}