import 'package:crypto_management_task/application/dtos/update_user_dto.dart';
import 'package:crypto_management_task/domain/entities/user.dart';
import 'package:crypto_management_task/domain/repositories/user_repository.dart';
import 'package:crypto_management_task/infrastructure/datasources/remote/user_api.dart';
import 'package:crypto_management_task/infrastructure/mappers/user_mapper.dart';
import 'package:crypto_management_task/infrastructure/models/user_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserApi _userApi;

  UserRepositoryImpl(this._userApi);

  @override
  Future<User> updatePhoneNumber(UpdateUserDto request) async {
    try {
      final response = await _userApi.updateUser(request);
      final userModel = UserModel.fromJson(response);
      return userModel.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
