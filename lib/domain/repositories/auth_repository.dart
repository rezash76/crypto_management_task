import 'package:crypto_management_task/application/dtos/login_dto.dart';
import 'package:crypto_management_task/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<void> login(LoginDto request);
  Future<User> getUser();
  Future<bool> isLoggedIn();
}
