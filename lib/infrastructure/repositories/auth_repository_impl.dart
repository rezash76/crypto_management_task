import 'package:crypto_management_task/application/dtos/login_dto.dart';
import 'package:crypto_management_task/domain/entities/user.dart';
import 'package:crypto_management_task/domain/repositories/auth_repository.dart';
import 'package:crypto_management_task/infrastructure/datasources/local/auth_storage.dart';
import 'package:crypto_management_task/infrastructure/datasources/remote/auth_api.dart';
import 'package:crypto_management_task/core/error/app_exception.dart';
import 'package:crypto_management_task/infrastructure/mappers/user_mapper.dart';
import 'package:crypto_management_task/infrastructure/models/auth_token_model.dart';
import 'package:crypto_management_task/infrastructure/models/user_model.dart';
import 'package:injectable/injectable.dart';

/// Implementation of [AuthRepository] that coordinates authentication logic.
///
/// This repository acts as an abstraction layer between the domain and data sources,
/// handling API communication via [AuthApi] and secure token storage via [AuthStorage].
/// It manages login, user retrieval, and authentication state checks, ensuring
/// business logic remains decoupled from infrastructure details.
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;
  final AuthStorage _authStorage;

  AuthRepositoryImpl(this._authApi, this._authStorage);

  @override
  Future<void> login(LoginDto request) async {
    try {
      final response = await _authApi.login(request);
      final tokenModel = AuthTokenModel.fromJson(response);
      if (tokenModel.authToken.isNotEmpty) {
        await _authStorage.saveToken(tokenModel.authToken);
      } else {
        throw AuthException();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> getUser() async {
    try {
      final response = await _authApi.getUser();
      final userModel = UserModel.fromJson(response);
      return userModel.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    return await _authStorage.isLoggedIn();
  }
}
