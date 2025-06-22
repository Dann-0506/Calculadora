import 'package:flutter/material.dart';
import 'package:calculadora/themes/dark_themes.dart';
import 'package:calculadora/themes/light_themes.dart';
import 'package:calculadora/themes/theme_extensions.dart';

ThemeData getThemeWithMode(int index, {bool darkMode = false}) {
  final baseTheme = darkMode ? ThemeData.dark() : ThemeData.light();
  final selectedTheme = darkMode ? darkThemes[index] : lightThemes[index];
  final customColors = selectedTheme.extension<CustomColors>();

  return baseTheme.copyWith(
    colorScheme: selectedTheme.colorScheme,
    extensions: [
      if (customColors != null) customColors,
    ],
  );
}
