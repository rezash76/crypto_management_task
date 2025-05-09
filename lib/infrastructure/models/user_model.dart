import 'package:crypto_management_task/domain/entities/user.dart';

/// Data model representing a user as received from or sent to external sources (e.g. APIs).
///
/// Provides factory constructors for mapping from JSON and from the domain [User] entity.
/// This class acts as a bridge between the infrastructure/data layer and the domain layer,
/// enabling serialization, deserialization, and conversion between different representations.

class UserModel {
  final int id;
  final int createdAt;
  final String name;
  final String email;
  final String? phoneNumber;
  final String? password;

  const UserModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      createdAt: json['created_at'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      password: json['password'],
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email.value,
      phoneNumber: user.phoneNumber?.value,
      password: user.password,
      createdAt: user.createdAt,
    );
  }
}
