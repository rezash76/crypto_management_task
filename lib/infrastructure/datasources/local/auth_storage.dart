import 'package:crypto_management_task/core/constants/storage_key_constants.dart';
import 'package:crypto_management_task/core/storage/storage_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthStorage {
  final StorageService<String> _storageService;

  AuthStorage(this._storageService);

  Future<void> saveToken(String token) async {
    return await _storageService.save(
      token,
      key: StorageKeyConstants.authToken,
    );
  }

  Future<String?> getToken() async {
    return await _storageService.get(key: StorageKeyConstants.authToken);
  }

  Future<void> clearToken() async {
    return await _storageService.delete(key: StorageKeyConstants.authToken);
  }

  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
