import 'package:bloc/bloc.dart';
import 'package:crypto_management_task/core/constants/storage_key_constants.dart';
import 'package:crypto_management_task/core/utils/extension/on_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_state.dart';

@injectable
class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeData(ThemeMode.light)) {
    _loadTheme();
  }

  void toggleTheme() {
    if ((state as AppThemeData).themeMode == ThemeMode.light) {
      emit(AppThemeData(ThemeMode.dark));
    } else {
      emit(AppThemeData(ThemeMode.light));
    }
  }

  void setTheme(ThemeMode themeMode) {
    emit(
      themeMode == ThemeMode.light
          ? AppThemeData(ThemeMode.light)
          : AppThemeData(ThemeMode.dark),
    );
  }

  @override
  void onChange(Change<AppThemeState> change) {
    super.onChange(change);
    _saveTheme((change.nextState as AppThemeData).themeMode);
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(StorageKeyConstants.appTheme) ?? 0;
    final themeMode = _convertIntToThemeMode(themeIndex);
    setTheme(themeMode);
  }

  Future<void> _saveTheme(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(StorageKeyConstants.appTheme, themeMode.toInt());
  }

  ThemeMode _convertIntToThemeMode(int value) {
    switch (value) {
      case 0:
        return ThemeMode.light;
      case 1:
        return ThemeMode.dark;
      case 2:
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }
}
