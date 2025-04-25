import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_management_task/domain/value_objects/phone_number.dart';

void main() {
  group('PhoneNumber value object', () {
    test(
      'should create PhoneNumber object with valid Iranian phone number',
      () {
        final phone = PhoneNumber('09123456789');
        expect(phone.value, '09123456789');

        final phone2 = PhoneNumber('+989123456789');
        expect(phone2.value, '+989123456789');
      },
    );

    test('should throw FormatException for invalid phone number', () {
      expect(() => PhoneNumber('9123456789'), throwsA(isA<FormatException>()));
      expect(
        () => PhoneNumber('00989123456789'),
        throwsA(isA<FormatException>()),
      );
      expect(() => PhoneNumber('0912345678'), throwsA(isA<FormatException>()));
      expect(
        () => PhoneNumber('091234567890'),
        throwsA(isA<FormatException>()),
      );
      expect(() => PhoneNumber('abcdefghijk'), throwsA(isA<FormatException>()));
      // not an Iranian number
      expect(() => PhoneNumber('9704095566'), throwsA(isA<FormatException>()));
      expect(() => PhoneNumber(''), throwsA(isA<FormatException>()));
    });

    test(
      'should throw FormatException with correct message for invalid phone number',
      () {
        expect(
          () => PhoneNumber('invalidPhoneNumber'),
          throwsA(
            isA<FormatException>().having(
              (e) => e.message,
              'message',
              'Invalid Iranian phone number.',
            ),
          ),
        );
      },
    );
  });
}
