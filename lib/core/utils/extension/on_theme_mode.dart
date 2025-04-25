import 'package:flutter/material.dart';

extension ThemeModeToInt on ThemeMode {
  /// Converts a [ThemeMode] to its corresponding int value for storage.
  int toInt() {
    switch (this) {
      case ThemeMode.light:
        return 0;
      case ThemeMode.dark:
        return 1;
      case ThemeMode.system:
        return 2;
    }
  }
}
