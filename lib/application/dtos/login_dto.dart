import 'package:crypto_management_task/application/dtos/dto.dart';
import 'package:crypto_management_task/domain/value_objects/email.dart';

base class LoginDto extends Dto {
  final Email email;
  final String password;

  LoginDto(this.email, this.password);

  @override
  Map<String, dynamic> toJson() => {'email': email.value, 'password': password};
}
