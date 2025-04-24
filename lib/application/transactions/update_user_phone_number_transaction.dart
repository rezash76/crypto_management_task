import 'package:crypto_management_task/application/dtos/update_user_dto.dart';
import 'package:crypto_management_task/application/transactions/transaction.dart';
import 'package:crypto_management_task/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateUserPhoneNumberTransaction
    implements Transaction<void, UpdateUserDto> {
  final UserRepository userRepository;

  UpdateUserPhoneNumberTransaction({required this.userRepository});

  @override
  Future<void> call(UpdateUserDto request) async =>
      await userRepository.updatePhoneNumber(request);
}
