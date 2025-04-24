import 'package:crypto_management_task/domain/entities/entity.dart';
import 'package:crypto_management_task/domain/value_objects/email.dart';
import 'package:crypto_management_task/domain/value_objects/phone_number.dart';

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
