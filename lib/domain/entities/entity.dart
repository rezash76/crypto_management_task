/// Base class for domain entities with unique identity and creation timestamp.
///
/// Provides value-based equality by comparing the [id] field and ensures
/// consistent hash codes for use in collections. Extend this class to
/// implement entities in your domain model.
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
