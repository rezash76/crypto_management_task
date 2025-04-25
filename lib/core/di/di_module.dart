import 'package:crypto_management_task/core/constants/api_constants.dart';
import 'package:crypto_management_task/core/constants/di_constants.dart';
import 'package:crypto_management_task/core/network/api_service.dart';
import 'package:crypto_management_task/core/network/dio/dio_client.dart';
import 'package:crypto_management_task/core/network/dio/interceptors/auth_interceptor.dart';
import 'package:crypto_management_task/core/network/dio/interceptors/error_interceptor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// Registers core dependencies for API services and secure storage.
@module
abstract class RegisterModule {
  /// Registers the authentication [ApiService] with required interceptors.
  /// Use [DiConstants.authName] for injection.
  /// Use [ApiConstants.authBaseUrl] as coin base url for using AuthApi and UserApi
  @Named(DiConstants.authName)
  @LazySingleton(as: ApiService)
  DioClient dioAuth(AuthInterceptor authInterceptor) => DioClient(
    baseUrl: ApiConstants.authBaseUrl,
    intercepros: [authInterceptor, ErrorInterceptor()],
  );

  /// Registers the coin [ApiService] with required interceptors.
  /// Use [DiConstants.coinName] for injection.
  /// Use [ApiConstants.coinBaseUrl] as coin base url for using CoinApi
  @Named(DiConstants.coinName)
  @LazySingleton(as: ApiService)
  DioClient dioCoin(AuthInterceptor authInterceptor) => DioClient(
    baseUrl: ApiConstants.coinBaseUrl,
    intercepros: [authInterceptor, ErrorInterceptor()],
  );

  /// Registers a singleton for secure local storage.
  @lazySingleton
  FlutterSecureStorage secureStorage() => const FlutterSecureStorage();
}
