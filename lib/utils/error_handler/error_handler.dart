import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'error_enums.dart';
import 'error_state.dart';


class ErrorHandler {
  static Future<Either<ErrorState, T>> callApi<T>(
      Future<Response> Function() api, T Function(dynamic) parse) async {
    try {
      final response = await api();
      switch (response.statusCode) {
        case 200:
          try {
            return right(parse(response.data));
          } catch (e) {
            return left(DataParseError(Exception(e.toString())));
          }
        case 401:
          return left(DataHttpError((AppHttpException.unAuthorized)));
        case 500:
          return left(
              DataHttpError((AppHttpException.internalServerError)));
        default:
          return left(DataHttpError((AppHttpException.unknownError)));
      }
    } on DioException catch (e) {
      return switch (e.type) {
        DioExceptionType.receiveTimeout =>
          left(DataNetworkError(AppNetworkException.timeOutError)),
        DioExceptionType.connectionTimeout =>
          left(DataNetworkError(AppNetworkException.timeOutError)),
        DioExceptionType.sendTimeout =>
        left(DataNetworkError(AppNetworkException.unknownError)),
        _ => left(DataNetworkError(AppNetworkException.unknownError)),
      };
    }
  }
}
