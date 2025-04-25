// lib/core/network/interceptors/error_interceptor.dart
import 'package:crypto_management_task/core/error/app_exception.dart';
import 'package:dio/dio.dart';

/// Intercepts HTTP errors and maps them to custom exception types.
///
/// Converts Dio errors and status codes (e.g. 401, 404, 500, timeouts) to
/// project-specific exceptions for consistent error handling across the app.
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Exception customException;

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      customException = NetworkException();
    } else if (err.response?.statusCode == 401) {
      customException = AuthException();
    } else if (err.response?.statusCode == 403) {
      customException = ForbiddenException();
    } else if (err.response?.statusCode == 404) {
      customException = NotFoundException();
    } else if (err.response?.statusCode == 500) {
      customException = ServerException();
    } else if (err.type == DioExceptionType.unknown) {
      customException = NetworkException();
    } else {
      customException = UnknownException(err.message ?? "Unknown error");
    }

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: customException,
        type: err.type,
        response: err.response,
      ),
    );
  }
}
