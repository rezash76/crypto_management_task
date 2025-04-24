import 'package:crypto_management_task/application/dtos/update_user_dto.dart';
import 'package:crypto_management_task/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<User> updatePhoneNumber(UpdateUserDto request);
}
