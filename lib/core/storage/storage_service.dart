abstract class StorageService<T> {
  Future<T?> get({required String key});
  Future<void> save(dynamic data, {required String key});
  Future<void> delete({required String key});
}
