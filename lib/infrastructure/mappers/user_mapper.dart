import 'package:crypto_management_task/domain/entities/user.dart';
import 'package:crypto_management_task/domain/value_objects/email.dart';
import 'package:crypto_management_task/domain/value_objects/phone_number.dart';
import 'package:crypto_management_task/infrastructure/models/user_model.dart';

/// Extension to map a [UserModel] (data/model layer) to a [User] domain entity.
///
/// Converts raw model data to strongly-typed value objects ([Email], [PhoneNumber])
/// and enforces domain validation, ensuring data consistency and business rule integrity
/// when moving from infrastructure to the domain layer.
extension UserModelMapper on UserModel {
  User toEntity() {
    PhoneNumber? phone;
    if (phoneNumber != null) {
      phone = PhoneNumber(phoneNumber!);
    }
    return User(
      id: id,
      createdAt: createdAt,
      name: name,
      email: Email(email),
      phoneNumber: phone,
      password: password,
    );
  }
}
