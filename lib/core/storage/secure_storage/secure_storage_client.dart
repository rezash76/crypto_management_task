import 'package:crypto_management_task/core/storage/storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: StorageService<String>)
class SecureStorageClient implements StorageService<String> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<String?> get({required String key}) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> save(data, {required String key}) async {
    await _storage.write(key: key, value: data);
  }

  @override
  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }
}
