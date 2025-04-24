import 'package:crypto_management_task/application/dtos/dto.dart';
import 'package:crypto_management_task/application/transactions/transaction.dart';
import 'package:crypto_management_task/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CheckUserIsLoginTransaction implements Transaction<bool, NoDto> {
  final AuthRepository authRepository;

  CheckUserIsLoginTransaction({required this.authRepository});

  @override
  Future<bool> call(NoDto request) async => await authRepository.isLoggedIn();
}
