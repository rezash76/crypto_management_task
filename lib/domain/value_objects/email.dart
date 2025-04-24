class Email {
  final String value;

  Email(this.value) {
    if (!_isValidEmail(value)) {
      throw FormatException('Invalid email address.');
    }
  }

  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,4}$');
    return regex.hasMatch(email);
  }

  @override
  String toString() => value;
}
