import 'package:crypto_management_task/application/dtos/update_user_dto.dart';
import 'package:crypto_management_task/core/constants/api_constants.dart';
import 'package:crypto_management_task/core/constants/di_constants.dart';
import 'package:crypto_management_task/core/network/api_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserApi {
  final ApiService _apiService;

  UserApi(@Named(DiConstants.authName) this._apiService);

  Future<Map<String, dynamic>> updateUser(UpdateUserDto userDto) async {
    try {
      final response = await _apiService.put(
        '${ApiConstants.user}/${userDto.userId}',
        data: userDto.toJson(),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
