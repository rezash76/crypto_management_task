/// Centralized collection of regular expressions used for validation across the app.
///
/// Provides reusable [RegExp] patterns for validating phone numbers and email addresses,
/// ensuring consistency between domain logic and UI form validations.
class RegexPatterns {
  static final RegExp phone = RegExp(r'^(09|\+989)\d{9}$');
  static final RegExp email = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
  );
}
