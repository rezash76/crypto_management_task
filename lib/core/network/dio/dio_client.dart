import 'package:crypto_management_task/core/network/api_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ApiService)
class DioClient implements ApiService {
  late final Dio _dio;
  Iterable<Interceptor>? _interceptors;

  DioClient({required String baseUrl, List<Interceptor>? intercepros}) {
    _dio = Dio();
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.options.responseType = ResponseType.json;
    _interceptors = intercepros;
    if (_interceptors != null) {
      _dio.interceptors.addAll(_interceptors!);
    }
  }

  @override
  Future<Response> delete(String path, {data}) async {
    try {
      final response = await _dio.delete(path, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> post(String path, {data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> put(String path, {data}) async {
    try {
      final response = await _dio.put(path, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
