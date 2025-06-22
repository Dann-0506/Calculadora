import 'package:flutter/material.dart';
import 'package:calculadora/themes/theme.dart';

class ThemeState {
  final int selectedThemeIndex;
  final bool isDarkMode;

  ThemeState({
    required this.selectedThemeIndex,
    required this.isDarkMode,
  });

  ThemeData get currentTheme {
    final themmeIndex = selectedThemeIndex.clamp(0, lightThemes.length - 1);
    return isDarkMode
        ? darkThemes[themmeIndex]
        : lightThemes[themmeIndex];
  }

  ThemeState copyWith({
    int? selectedThemeIndex,
    bool? isDarkMode,
  }) {
    return ThemeState(
      selectedThemeIndex: selectedThemeIndex ?? this.selectedThemeIndex,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}