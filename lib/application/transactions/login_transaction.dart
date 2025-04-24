import 'package:crypto_management_task/application/transactions/transaction.dart';
import 'package:crypto_management_task/application/dtos/login_dto.dart';
import 'package:crypto_management_task/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginTransaction implements Transaction<void, LoginDto> {
  final AuthRepository authRepository;

  LoginTransaction({required this.authRepository});

  @override
  Future<void> call(LoginDto request) async =>
      await authRepository.login(request);
}
