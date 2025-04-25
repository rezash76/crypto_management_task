import 'package:crypto_management_task/domain/entities/entity.dart';
import 'package:crypto_management_task/domain/value_objects/email.dart';
import 'package:crypto_management_task/domain/value_objects/phone_number.dart';

/// Domain entity representing a user with identity, contact, and authentication details.
///
/// The [phoneNumber] field uses a value object ([PhoneNumber]) to enforce business rules
/// around phone validation. This approach ensures that domain-specific constraints—such as
/// accepting only Iranian numbers now, and potentially supporting international formats in the future—
/// are handled within the entity itself, maintaining business integrity and flexibility.
class User extends Entity {
  final String name;
  final Email email;
  final String? password;
  final PhoneNumber? phoneNumber;

  User({
    required super.id,
    required super.createdAt,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });
}
