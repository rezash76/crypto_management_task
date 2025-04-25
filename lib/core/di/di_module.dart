import 'package:crypto_management_task/core/constants/api_constants.dart';
import 'package:crypto_management_task/core/constants/di_constants.dart';
import 'package:crypto_management_task/core/network/api_service.dart';
import 'package:crypto_management_task/core/network/dio/dio_client.dart';
import 'package:crypto_management_task/core/network/dio/interceptors/auth_interceptor.dart';
import 'package:crypto_management_task/core/network/dio/interceptors/error_interceptor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @Named(DiConstants.authName)
  @LazySingleton(as: ApiService)
  DioClient dioAuth(AuthInterceptor authInterceptor) => DioClient(
    baseUrl: ApiConstants.authBaseUrl,
    intercepros: [authInterceptor, ErrorInterceptor()],
  );

  @Named(DiConstants.coinName)
  @LazySingleton(as: ApiService)
  DioClient dioCoin(AuthInterceptor authInterceptor) => DioClient(
    baseUrl: ApiConstants.coinBaseUrl,
    intercepros: [authInterceptor, ErrorInterceptor()],
  );

  @lazySingleton
  FlutterSecureStorage secureStorage() => const FlutterSecureStorage();
}
