import 'package:flutter_project/domain/use_cases/base_use_case.dart';

class CalcUseCase extends BaseUseCase {
  CalcUseCase({required super.onStartLoading, required super.onEndLoading});

  int add (int a, int b) {
    return a + b;
  }

  int substract(int a, int b) {
    return a - b;
  }
}