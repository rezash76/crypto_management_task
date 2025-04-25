import 'package:crypto_management_task/core/utils/regex.dart';
import 'package:flutter/material.dart';

abstract class Validation<T> {
  /// Validated the given [value] and returns an error if validations fails.
  ///
  /// if tha validation passes, it should return `null`.
  ///
  /// [value] is the value to be validated.
  /// Returns an error string if the validation fails, otherwise returns `null`.
  String? validate(BuildContext context, T? value);
}

class RequiredValidation<T> extends Validation<T> {
  RequiredValidation();

  /// Check if the given [value] is empty or null.
  ///
  /// If the validation fails, it returns an error string, otherwise returns `null`.
  /// [value] is the value to be validated.
  @override
  String? validate(BuildContext context, T? value) {
    if (value == null) {
      return 'This field can\'t be empty';
    }
    if (value is String && (value as String).isEmpty) {
      return 'This field can\'t be empty';
    }
    return null;
  }
}

class PhoneValidation extends Validation<String> {
  PhoneValidation();

  /// Validate the given [value] as a phone number.
  ///
  /// If the validation fails, it returns an error string, otherwise returns `null`.
  /// [value] is the value to be validated.
  @override
  String? validate(BuildContext context, String? value) {
    if (value == null) return null;
    if (!RegexPatterns.phone.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }
}

class EmailValidation extends Validation<String> {
  EmailValidation();

  /// Validate the given [value] as an email address.
  ///
  /// If the validation fails, it returns an error string, otherwise returns `null`.
  /// [value] is the value to be validated.
  @override
  String? validate(BuildContext context, String? value) {
    if (value == null) return null;
    if (!RegexPatterns.email.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
}
