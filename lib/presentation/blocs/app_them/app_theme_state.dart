part of 'app_theme_cubit.dart';

@immutable
sealed class AppThemeState {}

final class AppThemeData extends AppThemeState {
  final ThemeData themeData;
  final AppTheme appTheme;
  AppThemeData(this.themeData, this.appTheme);
}

enum AppTheme { light, dark }
