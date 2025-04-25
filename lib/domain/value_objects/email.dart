import 'package:crypto_management_task/core/utils/regex.dart';

/// Value object representing a validated email address as part of business logic.
///
/// Enforces email format validation on creation and throws a [FormatException]
/// for invalid values. By modeling email as a value object, business rules
/// around email validation are centralized and consistently applied throughout the domain.
class Email {
  final String value;

  Email(this.value) {
    if (!_isValidEmail(value)) {
      throw FormatException('Invalid email address.');
    }
  }

  bool _isValidEmail(String email) {
    return RegexPatterns.email.hasMatch(email);
  }

  @override
  String toString() => value;
}
