import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_management_task/domain/value_objects/email.dart';

void main() {
  group('Email value object', () {
    test('should create Email object with valid email', () {
      final email = Email('test@example.com');
      expect(email.value, 'test@example.com');
    });

    test('should throw FormatException for invalid email', () {
      expect(() => Email('invalid-email'), throwsA(isA<FormatException>()));
      expect(() => Email('test@'), throwsA(isA<FormatException>()));
      expect(() => Email('test@com'), throwsA(isA<FormatException>()));
      expect(() => Email('test.com'), throwsA(isA<FormatException>()));
    });

    test(
      'should throw FormatException with correct message for invalid email',
      () {
        expect(
          () => Email('invalidEmail'),
          throwsA(
            isA<FormatException>().having(
              (e) => e.message,
              'message',
              'Invalid email address.',
            ),
          ),
        );
      },
    );
  });
}
