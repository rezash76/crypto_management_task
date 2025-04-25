import 'package:crypto_management_task/core/constants/storage_key_constants.dart';
import 'package:crypto_management_task/core/storage/storage_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// An HTTP interceptor that automatically adds the authentication token to outgoing requests.
///
/// Retrieves the JWT or auth token from [StorageService] and, if present,
/// attaches it as a Bearer token in the 'Authorization' header for each request.
/// Ensures that all API calls requiring authentication are properly authorized.
@lazySingleton
class AuthInterceptor extends Interceptor {
  final StorageService<String> _storageService;

  AuthInterceptor(this._storageService);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Fetch the auth token from secure storage and add it to the request headers if available.
    final token = await _storageService.get(key: StorageKeyConstants.authToken);
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }
}
