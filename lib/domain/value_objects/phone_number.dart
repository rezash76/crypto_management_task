import 'package:crypto_management_task/core/utils/regex.dart';

/// Value object representing a validated Iranian phone number as part of business logic.
///
/// Enforces phone number format validation on creation and throws a [FormatException]
/// for invalid values. By modeling phone numbers as a value object, business rules
/// around phone validation are centralized and consistently applied throughout the domain.
class PhoneNumber {
  final String value;

  PhoneNumber(this.value) {
    if (!_isValidPhone(value)) {
      throw FormatException('Invalid Iranian phone number.');
    }
  }

  bool _isValidPhone(String phone) {
    return RegexPatterns.phone.hasMatch(phone);
  }

  @override
  String toString() => value;
}
