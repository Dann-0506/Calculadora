import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:calculadora/logic/theme_logic.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeState _themeState = ThemeState(
    selectedThemeIndex: 0,
    isDarkMode: false,
  );

  ThemeProvider() {
    _loadThemePreferences();
  }

  ThemeState get themeState => _themeState;

  void setThemeIndex(int index) {
    _themeState = _themeState.copyWith(selectedThemeIndex: index);
    notifyListeners();
    _saveThemePreferences();
  }

  void setDarkMode(bool isDarkMode) {
    _themeState = _themeState.copyWith(isDarkMode: isDarkMode);
    notifyListeners();
    _saveThemePreferences();
  }

  ThemeData get currentTheme => _themeState.currentTheme;

  Future<void> _saveThemePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeIndex', _themeState.selectedThemeIndex);
    await prefs.setBool('isDarkMode', _themeState.isDarkMode);
  }
  
  Future<void> _loadThemePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt('themeIndex') ?? 0;
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _themeState = ThemeState(
      selectedThemeIndex: index,
      isDarkMode: isDarkMode,
    );
    notifyListeners();
  }
}