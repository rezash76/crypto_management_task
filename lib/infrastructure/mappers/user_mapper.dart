import 'package:crypto_management_task/domain/entities/user.dart';
import 'package:crypto_management_task/domain/value_objects/email.dart';
import 'package:crypto_management_task/domain/value_objects/phone_number.dart';
import 'package:crypto_management_task/infrastructure/models/user_model.dart';

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
