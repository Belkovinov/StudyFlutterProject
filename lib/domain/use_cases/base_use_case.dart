import 'package:dio/dio.dart';

class BaseUseCase {
  final Function() onStartLoading;
  final Function() onEndLoading;

  BaseUseCase({required this.onStartLoading, required this.onEndLoading});

  String getError(Exception e) {
    if (e is DioException) {
      if (e.response != null) {
        dynamic detail = e.response!.data['detail'];
        if (detail is String) {
          return detail;
        } else {
          return detail.toString();
        }
      } else {
        return e.toString();
      }
    } else {
      return e.toString();
    }
  }
}