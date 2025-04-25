import 'package:crypto_management_task/application/dtos/login_dto.dart';
import 'package:crypto_management_task/core/constants/api_constants.dart';
import 'package:crypto_management_task/core/constants/di_constants.dart';
import 'package:crypto_management_task/core/network/api_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthApi {
  final ApiService _apiService;

  AuthApi(@Named(DiConstants.authName) this._apiService);

  Future<Map<String, dynamic>> login(LoginDto loginDto) async {
    try {
      final response = await _apiService.post(
        ApiConstants.login,
        data: loginDto.toJson(),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getUser() async {
    try {
      final response = await _apiService.get(ApiConstants.me);
      return response.data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
