import 'package:flutter/material.dart';

class ThemeConfig {
  final Brightness brightness;
  final Color primaryColor;
  final Color secondaryColor;
  final Color background;
  final Color surface;
  final Color onSurface;

  ThemeConfig.light()
    : brightness = Brightness.light,
      primaryColor = const Color.fromARGB(255, 14, 3, 54),
      secondaryColor = Colors.white,
      background = const Color.fromARGB(255, 236, 240, 250),
      surface = const Color.fromARGB(255, 230, 226, 232),
      onSurface = const Color.fromARGB(255, 14, 3, 54);

  ThemeConfig.dark()
    : brightness = Brightness.dark,
      primaryColor = Colors.white70,
      secondaryColor = const Color.fromARGB(255, 39, 39, 44),
      background = const Color.fromARGB(255, 29, 29, 32),
      surface = const Color.fromARGB(255, 18, 7, 35),
      onSurface = const Color.fromARGB(234, 244, 240, 240);

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primaryColor,
        onPrimary: primaryColor,
        secondary: secondaryColor,
        onSecondary: primaryColor,
        error: Colors.red,
        onError: Colors.red,
        surface: surface,
        onSurface: onSurface,
      ),
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 5, 189, 122),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 14, 3, 54)),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all<Color>(Colors.white),
        trackColor: WidgetStateProperty.all<Color>(Colors.black87),
      ),
    );
  }
}
