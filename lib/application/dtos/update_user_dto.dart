import 'package:crypto_management_task/application/dtos/dto.dart';
import 'package:crypto_management_task/domain/value_objects/phone_number.dart';

base class UpdateUserDto extends Dto {
  final int userId;
  final PhoneNumber phoneNumber;

  UpdateUserDto(this.userId, this.phoneNumber);

  @override
  Map<String, dynamic> toJson() => {'phone_number': phoneNumber.value};
}
