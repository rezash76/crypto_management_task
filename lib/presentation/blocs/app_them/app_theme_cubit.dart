import 'package:bloc/bloc.dart';
import 'package:crypto_management_task/core/constants/storage_key_constants.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_state.dart';

@injectable
class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeData(lightTheme, AppTheme.light)) {
    _loadTheme();
  }

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepPurple,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
  );

  void toggleTheme() {
    if ((state as AppThemeData).appTheme == AppTheme.light) {
      emit(AppThemeData(darkTheme, AppTheme.dark));
    } else {
      emit(AppThemeData(lightTheme, AppTheme.light));
    }
  }

  void setTheme(AppTheme appTheme) {
    emit(
      appTheme == AppTheme.light
          ? AppThemeData(lightTheme, AppTheme.light)
          : AppThemeData(darkTheme, AppTheme.dark),
    );
  }

  @override
  void onChange(Change<AppThemeState> change) {
    super.onChange(change);
    _saveTheme((change.nextState as AppThemeData).appTheme);
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(StorageKeyConstants.appTheme) ?? 0;
    setTheme(AppTheme.values[themeIndex]);
  }

  Future<void> _saveTheme(AppTheme appTheme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(StorageKeyConstants.appTheme, appTheme.index);
  }
}
