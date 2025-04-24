import 'package:crypto_management_task/application/dtos/dto.dart';
import 'package:crypto_management_task/application/transactions/transaction.dart';
import 'package:crypto_management_task/domain/entities/user.dart';
import 'package:crypto_management_task/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserProfileTransaction implements Transaction<User, NoDto> {
  final AuthRepository authRepository;

  GetUserProfileTransaction({required this.authRepository});

  @override
  Future<User> call(NoDto request) async => await authRepository.getUser();
}
