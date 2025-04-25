import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_management_task/presentation/blocs/app_them/app_theme_cubit.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('AppThemeCubit', () {
    test('initial state is light theme', () {
      final cubit = AppThemeCubit();
      expect((cubit.state as AppThemeData).appTheme, AppTheme.light);
    });
  });
}
