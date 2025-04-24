abstract class Entity {
  final int id;
  final int createdAt;

  const Entity({required this.id, required this.createdAt});

  @override
  bool operator ==(Object other) {
    if (other is! Entity) {
      return false;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
