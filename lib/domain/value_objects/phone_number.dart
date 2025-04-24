class PhoneNumber {
  final String value;

  PhoneNumber(this.value) {
    if (!_isValidPhone(value)) {
      throw FormatException('Invalid Iranian phone number.');
    }
  }

  bool _isValidPhone(String phone) {
    final regex = RegExp(r'^(09|\+989)\d{9}$');
    return regex.hasMatch(phone);
  }

  @override
  String toString() => value;
}
